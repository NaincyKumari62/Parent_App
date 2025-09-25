import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/Colors/color.dart';

class CustomTile extends StatelessWidget {
  final String imagePath;
  final Color iconColor;
  final String title;
  final VoidCallback onTap;

  const CustomTile({
    super.key,
    required this.imagePath,
    required this.iconColor,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
                radius: 20,
                child: Image.asset(imagePath,width: 16,height: 18,fit: BoxFit.contain,),
            ),
           SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const Icon(Icons.arrow_forward_ios,
                size: 16, color: AppColor.grey_arrow),
          ],
        ),
      ),
    );
  }
}