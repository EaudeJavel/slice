// import 'dart:html';

// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:convert';

class SingleMenu {
  final List<Menu> menu;
  SingleMenu({required this.menu});
}

class Menu {
  final int id;
  final String name;
  final String description;
  final String shortDescription;
  final String nbrRecettes;
  // final ImageProvider descriptionPhoto;
  // final List recettes;

  Menu({
    required this.id,
    required this.name,
    required this.description,
    required this.shortDescription,
    // required this.descriptionPhoto,
    required this.nbrRecettes,
    // required this.recettes,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return new Menu(
      id: json["id"],
      name: json['nom'],
      description: json['description'],
      shortDescription: json['short_description'],
      // descriptionPhoto: json['description_photo'],
      nbrRecettes: json['nombre_recettes'],
      // recettes: json['recettes'],
    );
  }
}

Future<String> fetchMenu() async {
  final response =
      await http.get(Uri.parse('http://134.122.79.112/menus/?nom=batchmenu-1'));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load menu');
  }
}

Future<List> loadMenu() async {
  String jsonMenu = await fetchMenu();
  final jsonResponse = json.decode(jsonMenu);
  Menu menuList = Menu.fromJson(jsonResponse[0]);
  return [
    menuList.shortDescription,
    menuList.name,
    menuList.description,
    menuList.nbrRecettes
  ];
}
