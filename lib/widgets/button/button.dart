import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color textColor;
  final double borderRadius;
  final double elevation;
  final double width;

  const CustomButton2({
    Key? key,
    required this.text,
    required this.onPressed,
    required this. bgColor ,
    this.textColor = Colors.white,
    this.borderRadius = 5,
    this.elevation = 1.0,
    this.width=200


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Material(
        elevation: elevation,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color:  bgColor,
          ),
          child: Center(
            child: Text(text,style: TextStyle(color: Colors.white,fontSize: 13),),
          ),

        ),
      ),
    );
  }
}
