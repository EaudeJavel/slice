import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sliceapp/slice_theme.dart';

class PageDescription extends StatelessWidget {	
  final String description;

  
const PageDescription ({ 
    Key? key,
    required this.description
}): super(key: key);

@override
  Widget build(BuildContext context) {
	return 
    Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: 
        Center(
          child: Text(description,
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.center,
        )
      )
    );
  }
}