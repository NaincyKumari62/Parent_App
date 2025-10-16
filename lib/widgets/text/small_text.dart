import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double? fontsize;
  final TextDecoration? decoration;

  const SmallText({
    super.key,
    required this.text,
    this.fontsize=13,
    this.decoration=TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.center,
      style: TextStyle(
     fontSize: fontsize,
        decoration: decoration
    ),);
  }
}
