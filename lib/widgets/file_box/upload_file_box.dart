import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/Colors/color.dart';
import '../text/big_text.dart';
import '../text/medium_text.dart';

class UploadFileBox extends StatelessWidget {
  final File? image;
  final VoidCallback onTap;


  const UploadFileBox({
    Key? key,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(

          color:  AppColor.uploadFileBg,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color:AppColor.uploadFileBorder),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              image == null
                  ? Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(


                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image.asset(
                  'assets/images/upload_file.png',
                ),
              )
                  : Image.file(image!, height: 30.h, width: 20.w),
               SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  BigText(text:  "Drag & Drop or ",fontSize: 16.sp,fontWeight: FontWeight.w400,),
                  MediumText(text: "Choose file",fontSize: 16.sp,fontWeight: FontWeight.w400, txtColor: AppColor.blue,),
                  BigText(text:  " to upload",fontSize: 16.sp,fontWeight: FontWeight.w400,),


                ],
              ),
              const Text(
                "jpg, png, jpeg",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
