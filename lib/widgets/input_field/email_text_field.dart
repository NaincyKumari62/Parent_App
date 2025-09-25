import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailTextField extends StatefulWidget {
  final TextEditingController emailController;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;


  const EmailTextField({super.key, required this.emailController, this.suffixIcon, this.validator});

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: TextField(
          controller: widget.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            suffixIcon: null,
            hintText: 'Enter your Email ID',
            hintStyle: TextStyle(
                color: Colors.grey
            ),
            border: InputBorder.none,
          ),
        ),
      )

    );
  }
}
