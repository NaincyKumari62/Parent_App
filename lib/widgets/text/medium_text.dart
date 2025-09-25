import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? txtColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;


  const MediumText({
    super.key,
    required this.text,
    this.fontSize,
    this.textAlign = TextAlign.center,
    this.txtColor,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: textAlign,
      style: TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
        color: txtColor,

    ),);
  }
}
