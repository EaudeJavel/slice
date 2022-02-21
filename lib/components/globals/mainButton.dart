import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sliceapp/slice_theme.dart';

class MainButton extends StatelessWidget {	
  final String buttonText;
  final Widget route;

  
const MainButton ({ 
    Key? key,
    required this.buttonText,
    required this.route
}): super(key: key);

@override
  Widget build(BuildContext context) {
	return 
    Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      height: 60.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: ElevatedButton(             
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => route
              ),
            );
          } ,
          child: Text(buttonText),
          style: ElevatedButton.styleFrom(                
            primary: PrimaryColor,
            shape: StadiumBorder(),
            textStyle: TextStyle(
              fontSize: 16,
              fontFamily: "Inter",
              color: Colors.white
            )
          ),
        ),
      )
    );
  }
}