// import 'package:flutter/material.dart';
// import '../slice_theme.dart';
// import '../routes.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'dart:convert' show json, base64, ascii;

// class FirstLevelScaffold extends StatelessWidget {
//   FirstLevelScaffold(this.jwt, this.payload);
  
//   factory FirstLevelScaffold.fromBase64(String jwt) =>
//     FirstLevelScaffold(
//       jwt,
//       json.decode(
//         ascii.decode(
//           base64.decode(base64.normalize(jwt.split(".")[1]))
//         )
//       )
//     );

//   final String jwt;
//   final Map<String, dynamic> payload;

//   @override
//   Widget build(BuildContext context) =>
//     Scaffold(
//       appBar: AppBar(title: Text("Secret Data Screen")),
//       body: Center(
//         child: FutureBuilder(
//           future: http.read(Uri.parse('$SERVER_IP/recipes'), headers: {"Authorization": jwt}),
//           builder: (context, snapshot) =>
//             snapshot.hasData ?
//             Column(children: <Widget>[
//               Text("${payload['username']}, here's the data:"),
//               Text("texte résultat", style: Theme.of(context).textTheme.headline1)
//               // Text(snapshot.data, style: Theme.of(context).textTheme.headline1)
//             ],)
//             :
//             snapshot.hasError ? Text("An error occurred") : CircularProgressIndicator()
//         ),
//       ),
//     );
// }



import 'package:flutter/material.dart';
import '../slice_theme.dart';
import '../routes.dart';
// import 'package:http/http.dart' as http;
// // import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'dart:convert' show json, base64, ascii;


// const SERVER_IP = 'http://134.122.79.112/';
// final storage = FlutterSecureStorage();



class FirstLevelScaffold extends StatefulWidget {

  // logoutAction;
  // String name;
  // String picture;

  // const FirstLevelScaffold({
  //   // Key key,
  //   this.logoutAction, 
  //   this.name, 
  //   this.picture
  // }) 
  @override
  _FirstLevelScaffoldState createState() => new _FirstLevelScaffoldState();
}

class _FirstLevelScaffoldState extends State<FirstLevelScaffold>
  with SingleTickerProviderStateMixin {

  int _currentIndex = 0;
  final List<Widget> _screen = <Widget>[
    HomeScreen(),
    CourseScreen(),
    MRecetteScreen(),
    TestScreen()
    // ProfileScreen()
    // LoginScreen()
    //const EventsScreen(),
    
  ];
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _screen.length, vsync: this);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _controller.animateTo(index);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: TabBarView(children: _screen, controller: _controller),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: PrimaryColor,
        unselectedItemColor: TextColor,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Liste de courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack),
            label: 'Méga-recette',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}


// Center (
      //   child: FutureBuilder(
      //     future: http.read('$SERVER_IP/data', headers: {"Authorization": jwt}),
      //     builder: (context, snapshot) =>
      //       snapshot.hasData ?
      // TabBarView(children: _screen, controller: _controller),
      // :
        //     snapshot.hasError ? Text("An error occurred") : CircularProgressIndicator()
        // )),