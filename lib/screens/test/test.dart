import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliceapp/models/menu.dart';
import 'dart:async';
// ignore: unused_import
import 'dart:developer';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => TestScreenState();
}

class TestScreenState extends State<TestScreen> {
  late Future<List> futureMenu;

  @override
  void initState() {
    super.initState();
    futureMenu = loadMenu().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          FutureBuilder<List>(
            future: futureMenu,
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                ? CupertinoActivityIndicator()
                : Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: List.generate(
                      snapshot.data!.length,
                      (index) => Text(snapshot.data![index],
                        style: TextStyle(
                          fontSize: 25, color: Colors.black
                        )
                      )
                    ),
                  ),
                );
              },
            ),
          Text('cheh')
        ],
      )
    );
  }
}

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
