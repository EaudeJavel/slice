import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sliceapp/slice_theme.dart';

class PageTitle extends StatelessWidget {
	final String pageTitle;
  final String headerImg;

  
const PageTitle ({ 
    Key? key,
	  required this.pageTitle,
    required this.headerImg
}): super(key: key);

@override
  Widget build(BuildContext context) {
	return 
    Center(
        child: Container(
            child : Stack(
                children: <Widget>[
                    Image.asset(headerImg),
                    Container(
                        margin: const EdgeInsets.only(top: 25),  
                        child : Center( 
                            child: Text(pageTitle,
                            style: Theme.of(context).textTheme.subtitle2,
                            textAlign: TextAlign.center,
                            )
                        )
                    )
                ]
            )
        )
    );
  }
}