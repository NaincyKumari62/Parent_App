import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parent_app/res/Colors/color.dart';
import 'package:parent_app/widgets/button/button.dart';
import 'package:parent_app/widgets/button/small_rounded_button.dart';
import 'package:parent_app/widgets/text/big_text.dart';
import 'package:parent_app/widgets/text/medium_text.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),

      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppColor.cardBgColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(text: 'Arnavi Mahanti'),
              Image.asset('assets/images/circle.png')
            ],
          ),
          SizedBox(height: 10.h,),

          IconAndTextButton(
            icon: LucideIcons.video,
            iconSize: 20.r,
            cWidth: 120.w,
            cHeight: 35.h,
            radius: 10.r,
            btnName: 'Live CCTV',
            bgColor:AppColor.green_button
            ,
            onPressed: () {
              ImagePicker image_picker=ImagePicker();
              image_picker.pickImage(source: ImageSource.camera);
            },
          ),
          SizedBox(height: 10.h,),

          Row(
            children: [
              Image.asset('assets/images/car.png',scale: .7,),
              SizedBox(width: 15.w,),
              SmallRoundedButton(
                cWidth: 130.w,
                cHeight: 35.h,
                radius: 8.r,
                btnName: 'WB26BW9009',
                textColor: Colors.black,
                bgColor: Color(0xffEFEFEF),
                onPressed: (){},
              ),
            ],
          ),
          SizedBox(height: 7.h,),
          Divider(color: AppColor.dividerColor),
          SizedBox(height: 7.h,),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumText(text: 'Mr Suresh Singh',fontSize: 14.sp,),
              IconAndTextButton(
                icon: LucideIcons.phone,
                iconSize: 18.r,
                cWidth: 110.w,
                cHeight: 35.h,
                radius: 10.r,
                btnName: 'Contact',
                bgColor: AppColor.black,
                onPressed: () {
                 launch('tel: +91 6200783453');

                },
              ),

            ],
          )
          
        ],
      ),
    );
  }
}
