// import 'package:flutter/material.dart';
// import 'package:sliceapp/routes.dart';
// import 'package:http/http.dart' as http;
// // import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// // import 'dart:convert' show json, base64, ascii;


// class LoginScreen extends StatelessWidget {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   void displayDialog(context, title, text) => showDialog(
//       context: context,
//       builder: (context) =>
//         AlertDialog(
//           title: Text(title),
//           content: Text(text)
//         ),
//     );

//   Future<String> attemptLogIn(String username, String password) async {
//     var res = await http.post(
//       Uri.parse("$SERVER_IP/login"),
//       body: {
//         "username": username,
//         "password": password
//       }
//     );
//     if(res.statusCode == 200) return res.body;
//     return "test";
//   }

//   Future<int> attemptSignUp(String username, String password) async {
//     var res = await http.post(
//       Uri.parse('$SERVER_IP/signup'),
//       body: {
//         "username": username,
//         "password": password
//       }
//     );
//     return res.statusCode;
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Log In"),),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: _usernameController,
//               decoration: InputDecoration(
//                 labelText: 'Username'
//               ),
//             ),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Password'
//               ),
//             ),
//             TextButton(
//               onPressed: () async {
//                 var username = _usernameController.text;
//                 var password = _passwordController.text;
//                 var jwt = await attemptLogIn(username, password);
//                 if(jwt != null) {
//                   storage.write(key: "jwt", value: jwt);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => FirstLevelScaffold.fromBase64(jwt)
//                     )
//                   );
//                 } else {
//                   displayDialog(context, "An Error Occurred", "No account was found matching that username and password");
//                 }
//               },
//               child: Text("Log In")
//             ),
//             TextButton(
//               onPressed: () async {
//                 var username = _usernameController.text;
//                 var password = _passwordController.text;

//                 if(username.length < 4) 
//                   displayDialog(context, "Invalid Username", "The username should be at least 4 characters long");
//                 else if(password.length < 4) 
//                   displayDialog(context, "Invalid Password", "The password should be at least 4 characters long");
//                 else{
//                   var res = await attemptSignUp(username, password);
//                   if(res == 201)
//                     displayDialog(context, "Success", "The user was created. Log in now.");
//                   else if(res == 409)
//                     displayDialog(context, "That username is already registered", "Please try to sign up using another username or log in if you already have an account.");  
//                   else {
//                     displayDialog(context, "Error", "An unknown error occurred.");
//                   }
//                 }
//               },
//               child: Text("Sign Up")
//             )
//           ],
//         ),
//       )
//     );
//   }
// }


// // class LoginScreen extends StatefulWidget {
// //   @override
// //   _LoginScreenState createState() {
// //     return _LoginScreenState();
// //   }
// // }

// // class _LoginScreenState extends State<LoginScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: ListView(
// //         padding: const EdgeInsets.fromLTRB(10, 45, 10, 10),
// //         children: <Widget>[
// //           Container(
// //             child: 
// //                 Expanded(
// //                   child :Text('Connectez-vous pour accéder à toutes les fonctionnalités !',
// //                     style: Theme.of(context).textTheme.bodyText1
// //                   )
// //                 )
// //           ),
// //           // emailField,
// //           // passwordField,
// //           TextField(
// //             controller: _usernameController,
// //             decoration: InputDecoration(
// //               labelText: 'Username'
// //             ),
// //           ),
// //           TextField(
// //             controller: _passwordController,
// //             obscureText: true,
// //             decoration: InputDecoration(
// //               labelText: 'Password'
// //             ),
// //           ),
// //           ElevatedButton(
// //             child: Text("Log In"),
// //             onPressed: () async {
// //               var username = _usernameController.text;
// //               var password = _passwordController.text;

// //               var jwt = await attemptLogIn(username, password);
// //               if(jwt != null) {
// //                 storage.write(key: "jwt", value: jwt);
// //                 // Navigator.push(
// //                 //   context,
// //                 //   MaterialPageRoute(
// //                 //     builder: (context) => FirstLevelScafforld.fromBase64(jwt)
// //                 //   )
// //                 // );
// //                 PageRouteBuilder(
// //                   pageBuilder: (context, animation, secondaryAnimation) => FirstLevelScaffold(),
// //                   transitionsBuilder: (context, animation, secondaryAnimation, child) {
// //                     return child;
// //                   },
// //                 );
// //               } else {
// //                 displayDialog(context, "An Error Occurred", "No account was found matching that username and password");
// //               }
// //             },
// //           ),
// //           ElevatedButton(
// //             child: Text("Sign Up"),
// //             onPressed: /* TODO:HANDLE SIGN UP */
// //           )
          
// //           // Center(
// //           //   child: ElevatedButton(
// //           //     onPressed: () {
// //           //       Navigator.of(context).push(_createRouteLogin());
// //           //     },
// //           //     child: Text('Se connecter'),
// //           //   ),
// //           // ),
// //           // Center(
// //           //   child: TextButton(
// //           //     onPressed: () {
// //           //       Navigator.of(context).push(_createRouteResetPassword());
// //           //     },
// //           //     child: Text('Mot de passe oublié'),
// //           //   ),
// //           // ),
// //           // Center(
// //           //   child: ElevatedButton(
// //           //     onPressed: () {
// //           //       Navigator.of(context).push(_createRouteCreateAccount());
// //           //     },
// //           //     child: Text('Créer un compte'),
// //           //   ),
// //           // ),
// //         ],
// //       )
// //     );
// //   }
// //   final TextEditingController _usernameController = TextEditingController();
// // final TextEditingController _passwordController = TextEditingController();


// //   // final emailField = TextField(
// //   //   obscureText: false,
// //   //   // style: Theme.of(context).textTheme.bodyText1,
// //   //   decoration: InputDecoration(
// //   //       // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
// //   //       hintText: "Email",
// //   //       // border:
// //   //           // OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
// //   //   )
// //   // );

// //   // final passwordField = TextField(
// //   //   obscureText: true,
// //   //   // style: Theme.of(context).textTheme.bodyText1,
// //   //   decoration: InputDecoration(
// //   //       // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
// //   //       hintText: "Password",
// //   //       // border:
// //   //           // OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
// //   //   ),
// //   // );


// // }
// // // Route _createRouteLogin() {
// // //   return PageRouteBuilder(
// // //     pageBuilder: (context, animation, secondaryAnimation) => FirstLevelScaffold(),
// // //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
// // //       return child;
// // //     },
// // //   );
// // // }

// // // Route _createRouteResetPassword() {
// // //   return PageRouteBuilder(
// // //     pageBuilder: (context, animation, secondaryAnimation) => ResetScreen(),
// // //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
// // //       return child;
// // //     },
// // //   );
// // // }

// // // Route _createRouteCreateAccount() {
// // //   return PageRouteBuilder(
// // //     pageBuilder: (context, animation, secondaryAnimation) => CreateScreen(),
// // //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
// // //       return child;
// // //     },
// // //   );
// // // }

// // void displayDialog(BuildContext context, String title, String text) => 
// // showDialog(
// //   context: context,
// //   builder: (context) =>
// //     AlertDialog(
// //       title: Text(title),
// //       content: Text(text)
// //     ),
// // );

// // Future<String> attemptLogIn(String username, String password) async {
// //   var res = await http.post(
// //     "$SERVER_IP/login",
// //     body: {
// //       "username": username,
// //       "password": password
// //     }
// //   );
// //   if(res.statusCode == 200) return res.body;
// //   return null;
// // }

// // Future<int> attemptSignUp(String username, String password) async {
// //   var res = await http.post(
// //     '$SERVER_IP/signup',
// //     body: {
// //       "username": username,
// //       "password": password
// //     }
// //   );
// //   return res.statusCode;  
// // }
