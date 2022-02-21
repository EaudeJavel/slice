// // import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// // ignore: unused_import
// import 'package:sliceapp/components/globals/tile.dart';
// import 'dart:convert';

// class Allergene {
//     final int id;
// 	  final String name;
//     // final Widget image;

  
// const Allergene ({ 
//   Key? key,
//   required this.id,
// 	required this.name,
//   // required this.image,
// });

//   factory Allergene.fromJson(Map<String, dynamic> json) {
//     return Allergene(
//       id: json['id'],
//       name: json['name'],
//       // image: json['icon'],
//     );
//   }
// }

// Future<Allergene> fetchAllergene() async {
//   final response =
//       await http.get(Uri.parse('http://134.122.79.112/allergenes'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     debugPrint(response.body);
//     return Allergene.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load allergene');
//   }
// }

// import 'base_model.dart';

// class Allergene extends BaseModel {
//   Allergene.fromJson(Map<String, dynamic> json):
//         allergeneName = json['name'],
//         // profilePicture = json['profilePicture'],
//         super(json: json);

//   String allergeneName;
//   // String profilePicture;

//   @override
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = super.toJson();
//     json.addAll(<String, dynamic>{
//       'name': allergeneName,
//       // 'profilePicture': profilePicture,
//     });
//     return json;
//   }
// }
