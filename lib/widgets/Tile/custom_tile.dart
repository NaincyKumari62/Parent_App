import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/Colors/color.dart';

class CustomTile extends StatelessWidget {
  final IconData? icon;

  final Color iconColor;
  final String title;
  final VoidCallback onTap;

  const CustomTile({
    super.key,
    required this.iconColor,
    required this.title,
    required this.onTap, this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,

              radius: 20.r,
              child: Icon(
                icon,
                color: iconColor,
                size: 20.sp,
              ),
              // child: Image.asset(imagePath,width: 16,height: 18,fit: BoxFit.contain,),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style:  TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            Padding(
              padding:  EdgeInsets.only(right: 20.0),
              child: Icon(LucideIcons.chevron_right,
                  size: 16.sp, color: AppColor.grey_arrow),
            ),
          ],
        ),
      ),
    );
  }
}