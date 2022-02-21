import 'package:flutter/material.dart';
// import 'package:sliceapp/routes.dart';
// import 'package:sliceapp/slice_theme.dart';

// import 'package:sliceapp/utils/shared_prefs.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:gpt_3_dart/gpt_3_dart.dart';


// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:sliceapp/components/globals/tile.dart';



// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() {
//     return _ProfileScreenState();
//   }
// }

// class _ProfileScreenState extends State<ProfileScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         padding: const EdgeInsets.fromLTRB(10, 45, 10, 10),
//         children: <Widget>[
//           Container(
//             child: 
//                 Expanded(
//                   child :Text('Profile',
//                     style: Theme.of(context).textTheme.bodyText1
//                     // style : TextStyle(fontFamily: 'Damion')
//                   )
//                 )
//           ),
//           // Center(
//           //   child: ElevatedButton(
//           //     onPressed: () {
//           //       // rajouter ici changement de state user
//           //       Navigator.of(context).push(
//           //         PageRouteBuilder(
//           //           pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
//           //           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           //             return child;
//           //           },
//           //         )
//           //       );
//           //     },
//           //     child: Text('Deconnexion'),
//           //   ),
//           // ),
//         ],
//       )
//     );
//   }
// }

void main() async {
  OpenAI openAI = new OpenAI(apiKey: "sk-qrkLZw0dDBWNnUnHkTvaQwCJe3X5svfxTjvIkHRD");
  String complete = await openAI.complete("This is a test.", 10);
  List search = await openAI
      .search(["White House", "hospital", "school"], "the president");
  print(complete);
  print(search);
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreen createState() => new _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("oui",
        style: TextStyle(
              fontSize: 16,
              fontFamily: "Inter",
              color: Colors.black
            )
      )
    );
  }
  }


// class ProfileScreen extends StatelessWidget {
//   // final logoutAction;
//   // final String name;
//   // final String picture;

//   // ProfileScreen(this.logoutAction, this.name, this.picture);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         padding: const EdgeInsets.fromLTRB(10, 45, 10, 10),
//         children: <Widget>[
//           Container(
//             child: 
//               Expanded(child: ,)
//               // Expanded(
//               //   // child :Text("Hi ${sharedPrefs.username}",
//               //   // child : Text("Hi ${sharedPrefs.username}",
//               //   child : Text("Hi zebi",
//               //     style: Theme.of(context).textTheme.bodyText1
//               //     // style : TextStyle(fontFamily: 'Damion')
//               //   )
//               // )
//           ),
//           // Container(
//           //   width: 150,
//           //   height: 150,
//           //   decoration: BoxDecoration(
//           //     border: Border.all(color: Colors.blue, width: 4.0),
//           //     shape: BoxShape.circle,
//           //     image: DecorationImage(
//           //       fit: BoxFit.fill,
//           //       image: NetworkImage(picture),
//           //     ),
//           //   ),
//           // ),
//     // return Column(
//     //   mainAxisAlignment: MainAxisAlignment.center,
//     //   children: <Widget>[
//     //     Text("profile")
//       //   Container(
//       //     width: 150,
//       //     height: 150,
//       //     decoration: BoxDecoration(
//       //       border: Border.all(color: Colors.blue, width: 4.0),
//       //       shape: BoxShape.circle,
//       //       image: DecorationImage(
//       //         fit: BoxFit.fill,
//       //         image: NetworkImage(picture),
//       //       ),
//       //     ),
//       //   ),
//       //   SizedBox(height: 24.0),
//       //   Text('Name: $name'),
//       //   SizedBox(height: 48.0),
//       //   RaisedButton(
//       //     onPressed: () {
//       //       logoutAction();
//       //     },
//       //     child: Text('Logout'),
//       //   ),
//       ],
//       )
//     );
//   }
// }
