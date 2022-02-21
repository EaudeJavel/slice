import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sliceapp/slice_theme.dart';

class AsterixText extends StatelessWidget {
	final String asterix;

  
const AsterixText ({ 
    Key? key,
	  required this.asterix,
}): super(key: key);

@override
  Widget build(BuildContext context) {
	return 
     Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 15),
      child: Center(
        child: Text(asterix,
        style: Theme.of(context).textTheme.headline4,
        textAlign: TextAlign.center,
        )
      )
    );
  }
}