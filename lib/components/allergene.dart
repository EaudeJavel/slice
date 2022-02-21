// import 'dart:html';

// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:convert';

// class SingleAllergene {
//   final List<Allergene> allergene;
//   SingleAllergene({required this.allergene});
// }

class Data {
  final String name;
  final int id;

  Data({required this.id, required this.name});

  factory Data.fromJson(Map<String, dynamic> json) {
    return new Data(id: json['id'], name: json['name']);
  }
}

// List<Data> parseData(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

//   return parsed.map<Data>((json) => Data.fromJson(json)).toList();
// }

Future<List<Data>> fetchData() async {
  final response =
      await http.get(Uri.parse('http://134.122.79.112/allergenes/'));

  if (response.statusCode == 200) {
    debugPrint(response.body);
    // return parseData(response.body);
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new Data.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load Data');
  }
}




// Future<List<Data>> loadAllergenes() async {
//   ListwData jsonAllergene = await fetchData();
//   final jsonResponse = json.decode(jsonAllergene);
//   Data allergeneList = Data.fromJson(jsonResponse);

//   // print("photos " + allergeneList.name[0]);
//   debugPrint(allergeneList.name);
//   return "nom des allergenes : " + allergeneList.name;
// }
