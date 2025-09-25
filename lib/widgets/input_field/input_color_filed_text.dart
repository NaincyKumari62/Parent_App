import 'package:flutter/material.dart';

class InputColorFiledText extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? borderColor;
  final Color? fillColor;

  const InputColorFiledText({
    super.key,
    required this.controller,
    required this.hintText,
    this.borderColor,
    this.fillColor = const Color(0xffF7F7F7),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: fillColor,
      ),
      child: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: borderColor == null
                ? InputBorder.none
                : OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor!),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
      ),
    );
  }
}
