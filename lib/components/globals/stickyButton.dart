import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sliceapp/slice_theme.dart';

class StickyButton extends StatelessWidget {	
  final String buttonText;
  final Widget route;

  
const StickyButton ({ 
    Key? key,
    required this.buttonText,
    required this.route
}): super(key: key);

@override
  Widget build(BuildContext context) {
	return 
    Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 80.0,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFFF3E8BE), 
              spreadRadius: 0,
              blurRadius: 64, 
              offset: Offset(0, 20)
            )
          ]
        ),
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
            // shape: StadiumBorder(),
            textStyle: TextStyle(
              fontSize: 18,
              fontFamily: "Inter",
              fontWeight: FontWeight.w800,
              color: Colors.white
            ),
          ),
        ),
      )
    );
  }
}