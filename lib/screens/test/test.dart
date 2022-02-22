// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliceapp/models/menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:developer';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => TestScreenState();
}

class TestScreenState extends State<TestScreen> {
  // late Future<List> futureMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Liste de course',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        backgroundColor: Color(0xFFFEF1D7),
        body: ListView(children: <Widget>[
          Text(
            'caca',
            style: Theme.of(context).textTheme.subtitle1,
          )
        ]));
  }
}

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference ingredients =
        FirebaseFirestore.instance.collection('ingredients');

    return FutureBuilder<DocumentSnapshot>(
      future: ingredients.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['nom']}");
        }

        return Text("loading");
      },
    );
  }
}




//   @override
//   void initState() {
//     super.initState();
//     futureMenu = loadMenu().whenComplete(() {
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: <Widget>[
//           FutureBuilder<List>(
//             future: futureMenu,
//             builder: (context, snapshot) {
//               return snapshot.connectionState == ConnectionState.waiting
//                 ? CupertinoActivityIndicator()
//                 : Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Column(
//                     children: List.generate(
//                       snapshot.data!.length,
//                       (index) => Text(snapshot.data![index],
//                         style: TextStyle(
//                           fontSize: 25, color: Colors.black
//                         )
//                       )
//                     ),
//                   ),
//                 );
//               },
//             ),
//           Text('cheh')
//         ],
//       )
//     );
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//       children: <Widget>[
//         FutureBuilder<List>(
//           future: futureMenu,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               log(snapshot.data!);
//               return Text(
//                 snapshot.data!,
//                 style: Theme.of(context).textTheme.headline4,
//               );
//             } else if (snapshot.hasError) {
//               return Text('cheh');
//             }
//             // By default, show a loading spinner.
//             return CircularProgressIndicator();
//           },
//         ),
//         Text('cheh')
//       ],
//     ));
//   }
// }
