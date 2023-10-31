import 'package:flutter/material.dart';


class mybuttons extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;
   mybuttons({ this.color, this.textColor, required this.buttonText, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:buttonTapped ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: color,
              child: Center(
                child: Text(buttonText,style: TextStyle(color: textColor,fontSize: 30,fontWeight: FontWeight.bold),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
