
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextField extends StatefulWidget {
  final String hintText;
  final bool? isHintText;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final double? fontSize;
  final bool readOly;
  final String?Function(String?)? validator;
  final Widget? suffixIcon;
  


  const InputTextField({
    super.key,
    required this.controller,
     required this.hintText,
    this.isHintText = false,
    this.textInputType = TextInputType.text,
    this.validator,
    this.suffixIcon,
    this.readOly = false,
    this.fontSize = 14,


  });

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        TextFormField(
          readOnly: widget.readOly,
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
            hintStyle: TextStyle(
              fontSize: widget.fontSize
            ),
            hintText: widget.isHintText == true ? widget.hintText : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Color(0xffF0F2F5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.red),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.red),
            ),
          ),

        ),
      ],
    );
  }
}
