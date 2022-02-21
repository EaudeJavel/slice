import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sliceapp/slice_theme.dart';

class MainTitle extends StatelessWidget {
	  final String title;

  
const MainTitle ({ 
  Key? key,
	required this.title,
}): super(key: key);

@override
  Widget build(BuildContext context) {
	return 
   Center(
    child: Container(
      margin: const EdgeInsets.only(top: 0, bottom: 10),              
      child:
        Center(
          child: Text(title,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,      
          )
        )
      ),
    );
  }
}