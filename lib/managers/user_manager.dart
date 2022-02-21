// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../models/user.dart';
// import 'package:sliceapp/managers/user_state.dart';
// export 'package:sliceapp/managers/user_state.dart';

// class UserManager {
//   UserManager._internal() {
//     _loadFromMemory();
//   }

//   static final UserManager _singleton = UserManager._internal();
//   static const String _keyToken = 'app_token';
//   static const String _keyUserId = 'user_id';
//   static const String _keyUser = 'user';
//   User _user;
//   String _userId;
//   String _token;
//   bool _ready;
//   List<UserState> userStates = <UserState>[];

//   static UserManager sharedInstance() {
//     return _singleton;
//   }

//   void registerUserState(UserState state) {
//     userStates.add(state);
//   }

//   // Future<void> _loadFromMemory () async {
//   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   _token = prefs.getString(_keyToken)!;
//   //   _userId = prefs.getString(_keyUserId)!;
//   //   final String? strUserData = prefs.getString(_keyUser);
//   //   if (strUserData != null) {
//   //     _user = User.fromJson(jsonDecode(strUserData));
//   //     //for(UserState state in userStates) {
//   //     //  state.userLogin();
//   //     //}
//   //   }
//   //   _ready = true;
//   // }

//   // Future<void> waitInit() async {
//   //   return Future.doWhile(() async {
//   //     if (_ready == false || _ready == null) {
//   //       await Future<void>.delayed(Duration(milliseconds: 500));
//   //     }
//   //     return _ready == false || _ready == null;
//   //   });
//   // }

//   Future<void> setUser (Map<String, dynamic> user) async {
//     _user = User.fromJson(user);
//     _userId = _user.id;
//     for(UserState state in userStates) {
//       state.userLogin();
//     }
//   }

//   User getCurrentUser () {
//     return _user;
//   }

//   String getCurrentUserId () {
//     return _userId;
//   }

//   bool isLogged () {
//     return _token != null;
//   }

//   // Future<void> logout () async {
//   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   _user = null;
//   //   _token = null;
//   //   _userId = null;
//   //   await prefs.setString(_keyToken, null);
//   //   await prefs.setString(_keyUserId, null);
//   //   for(UserState state in userStates) {
//   //     state.userLogout();
//   //   }
//   // }

//   Future<bool> saveToken (Map<String, dynamic> response) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     print('token: ${response['token']}\n');
//     final User user = User.fromJson(response['user']);
//     await prefs.setString(_keyUser, jsonEncode(user.toJson()));
//     await prefs.setString(_keyToken, response['token']);
//     _token = response['token'];
//     return true;
//   }

//   Future<String> getToken () async {
//     return _token;
//   }
// }