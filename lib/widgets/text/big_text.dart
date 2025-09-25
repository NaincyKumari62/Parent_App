import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? txtColor;
  final TextDecoration? decoration;

  const BigText({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.txtColor,
    this.fontWeight = FontWeight.bold,
    this.decoration=TextDecoration.none

  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
        fontWeight: fontWeight,
        color: txtColor,
        fontSize: fontSize,
    decoration: decoration),);
  }
}
