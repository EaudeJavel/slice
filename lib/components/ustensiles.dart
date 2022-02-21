// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:sliceapp/components/globals/tile.dart';

// ignore: unused_import
import 'dart:convert';



class Ustensiles extends StatelessWidget {
	  final String name;
    final Widget image;

  
const Ustensiles ({ 
  Key? key,
	required this.name,
  required this.image,
}): super(key: key);

@override
  Widget build(BuildContext context) {
	return 
    CustomTile(icon: image, tileTitle: name);
  }
}