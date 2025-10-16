
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class IconAndTextButton extends StatelessWidget {
  final double cWidth;
  final double cHeight;
  final String btnName;
  final Color bgColor;
  final IconData? icon;
  final Color? textColor;
  final double? radius;
  final double? textFont;
  final double iconSize;
  final VoidCallback onPressed;

  const IconAndTextButton({
    super.key,
    required this.cWidth,
    required this.cHeight,
    required this.btnName,
    required this.bgColor,
    this.textFont,
    this.icon,
    this.iconSize =30,
    this.textColor = const Color(0xffFFFFFF),
    this.radius = 20,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: cWidth,
        height: cHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          color: bgColor,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(icon,color: Colors.white,size: iconSize,),
                Text(
                  btnName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: textFont
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
