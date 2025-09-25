import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  const SmallText({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.center,
      style: TextStyle(
      fontSize: 13,

    ),);
  }
}
