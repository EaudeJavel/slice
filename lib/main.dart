// @dart=2.9

// import 'package:flutter/foundation.dart';

// /// -----------------------------------
// ///          External Packages
// /// -----------------------------------

// import 'package:sliceapp/app_config.dart';

import 'package:flutter/material.dart';
import 'package:sliceapp/slice_theme.dart';
import 'package:sliceapp/routes.dart';
import 'package:sliceapp/utils/shared_prefs.dart';
import 'package:easy_localization/easy_localization.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();
final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

// ignore: unused_element
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

// /// -----------------------------------
///           Auth0 Variables
// /// -----------------------------------

const AUTH0_DOMAIN = 'dev-pkkgp6na.eu.auth0.com';
const AUTH0_CLIENT_ID = 'ISfBu18karjFIhCsb2lSLculpHZhChz2';

const AUTH0_REDIRECT_URI = 'com.auth0.flutterdemo://login-callback';
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';

// /// -----------------------------------
///           Profile Widget
// /// -----------------------------------

class Profile extends StatelessWidget {
  final logoutAction;
  final String name;
  final String picture;

  Profile(this.logoutAction, this.name, this.picture);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Container(
        //   width: 150,
        //   height: 150,
        //   decoration: BoxDecoration(
        //     border: Border.all(color: Colors.blue, width: 4.0),
        //     shape: BoxShape.circle,
        //     image: DecorationImage(
        //       fit: BoxFit.fill,
        //       image: NetworkImage(picture),
        //     ),
        //   ),
        // ),
        SizedBox(height: 24.0),
        Text("Hi ${SharedPrefs().username}"),
        SizedBox(height: 48.0),
        ElevatedButton(
          onPressed: () {
            logoutAction();
          },
          child: Text('Logout'),
        ),
      ],
    );
  }
}

// /// -----------------------------------
// ///            Login Widget
// /// -----------------------------------

class Login extends StatelessWidget {
  final loginAction;
  final String loginError;

  const Login(this.loginAction, this.loginError);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('lib/assets/images/header_login.png'),
        Spacer(flex: 2),
        Text("Bonjour", style: Theme.of(context).textTheme.headline1),
        Container(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Text(
            "Bienvenue sur Slice !",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            loginAction();
          },
          child: Text('Inscription et connexion'),
        ),
        Text(loginError),
        Spacer(flex: 5),
        // ElevatedButton(
        //   onPressed: () {
        //     // logoutAction();
        //   },
        //   child: Text('Logout'),
        // ),
      ],
    )));
  }
}

// /// -----------------------------------
// ///                 App
// /// -----------------------------------
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  //firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await sharedPrefs.init();
  runApp(
    SliceApp(),
  );
}

class SliceApp extends StatefulWidget {
  @override
  _SliceAppState createState() => _SliceAppState();
}

// /// -----------------------------------
// ///              App State
// /// -----------------------------------

class _SliceAppState extends State<SliceApp> {
  bool isBusy = false;
  bool isLoggedIn = false;
  String errorMessage = " ";
  String name = "test";
  String picture = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slice',
      theme: getTheme(),
      home:

          // Scaffold(
          //   body: Center(
          //     child: Text("Hi",
          //       style: Theme.of(context).textTheme.bodyText1)
          //   ),
          // ),
          isBusy
              ? Scaffold(body: Center(child: CircularProgressIndicator()))
              : isLoggedIn
                  // ? Profile(logoutAction, name, picture)
                  // ? Profile()
                  ? FirstLevelScaffold()
                  //FirstLevelScaffold()
                  : Login(loginAction, errorMessage),
    );
  }

  Map<String, dynamic> parseIdToken(String idToken) {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  }

  Future<Map<String, dynamic>> getUserDetails(String accessToken) async {
    final Uri url = Uri.parse('https://$AUTH0_DOMAIN/userinfo');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }

  Future<void> loginAction() async {
    setState(() {
      isBusy = true;
      errorMessage = '';
    });

    try {
      final AuthorizationTokenResponse result =
          await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          AUTH0_CLIENT_ID,
          AUTH0_REDIRECT_URI,
          issuer: 'https://$AUTH0_DOMAIN',
          scopes: ['openid', 'profile', 'offline_access'],
          // promptValues: ['login']
        ),
      );

      final idToken = parseIdToken(result.idToken);
      final profile = await getUserDetails(result.accessToken);

      await secureStorage.write(
          key: 'refresh_token', value: result.refreshToken);

      setState(() {
        isBusy = false;
        // _isLoggedIn = _prefs.setBool("isLoggedIn", true).then((bool success) {
        //   return isLoggedIn;
        // });
        isLoggedIn = true;
        name = idToken['name'];
        picture = profile['picture'];
        // store in shared prefs
        // _name = _prefs.setString("keyUsername", idToken['name']).then((bool success) {
        //   return _name;
        // });
        // ignore: unused_element
        Future<void> setName() async {
          // debugPrint('set username: $idToken["name"]');
          sharedPrefs.username = idToken['name'];
          // prefs.setString("keyUsername", idToken['name']);
        }
        // _picture = _prefs.setString("keyPicture", profile['picture']).then((bool success) {
        //   return _picture;
        // });
      });

      // ignore: unused_element
      setUserData(name, picture, isLoggedIn) async {
        isLoggedIn = true;
        // ignore: unused_local_variable
        String name = this.name;
        // ignore: unused_local_variable
        String picture = this.picture;
      }
    } catch (e, s) {
      print('login error: $e - stack: $s');

      setState(() {
        isBusy = false;
        // _isLoggedIn = _prefs.setBool("isLoggedIn", false).then((bool success) {
        //   return isLoggedIn;
        // });
        isLoggedIn = false;
        errorMessage = e.toString();
      });
    }
  }

  void logoutAction() async {
    await secureStorage.delete(key: 'refresh_token');
    setState(() {
      // _isLoggedIn = _prefs.setBool("isLoggedIn", false).then((bool success) {
      //   return isLoggedIn;
      // });
      isLoggedIn = false;
      isBusy = false;
    });
  }

  @override
  void initState() {
    initAction();
    super.initState();
  }

  void initAction() async {
    final storedRefreshToken = await secureStorage.read(key: 'refresh_token');
    if (storedRefreshToken == null) return;

    setState(() {
      isBusy = true;
    });

    try {
      final response = await appAuth.token(TokenRequest(
        AUTH0_CLIENT_ID,
        AUTH0_REDIRECT_URI,
        issuer: AUTH0_ISSUER,
        refreshToken: storedRefreshToken,
      ));

      final idToken = parseIdToken(response.idToken);
      final profile = await getUserDetails(response.accessToken);

      secureStorage.write(key: 'refresh_token', value: response.refreshToken);

      setState(() {
        isBusy = false;
        // _isLoggedIn = _prefs.setBool("isLoggedIn", true).then((bool success) {
        //   return _isLoggedIn;
        // });

        isLoggedIn = true;
        name = idToken['name'];
        picture = profile['picture'];
        // store in shared prefs
        // ignore: unused_element
        Future<void> setName() async {
          // debugPrint('set username: $idToken["name"]');
          sharedPrefs.username = idToken['name'];
          print(sharedPrefs);
          // prefs.setString("keyUsername", idToken['name']);
        }
        // Future<void> setName() async {
        //   final prefs = await SharedPreferences.getInstance();
        //   prefs.setString("keyUsername", idToken['name']);
        // }
        // _name = _prefs.setString("keyUsername", idToken['name']).then((bool success) {
        //   return _name;
        // });
        // _picture = _prefs.setString("keyPicture", profile['picture']).then((bool success) {
        //   return _picture;
        // });
      });
    } catch (e, s) {
      print('error on refresh token: $e - stack: $s');
      logoutAction();
    }
  }
}
