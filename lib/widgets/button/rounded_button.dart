import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color bgColor;
  final double? cHeight;
  final Color textColor;
  final double borderRadius;
  final double elevation;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this. bgColor ,
    this.textColor = Colors.white,
    this.borderRadius = 8,
    this.elevation = 2.0,
    this.cHeight = 50,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Material(
        elevation: elevation,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: double.infinity,
          height: cHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color:  bgColor,
          ),
          child: Center(
            child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
          ),

        ),
      ),
    );
  }
}
