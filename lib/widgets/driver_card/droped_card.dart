import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../res/Colors/color.dart';
import '../button/button.dart';
import '../button/small_rounded_button.dart';
import '../text/big_text.dart';
import '../text/medium_text.dart';

class DropedCard extends StatelessWidget {
  const DropedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),

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

          SmallRoundedButton(
            cWidth: 120.w,
            cHeight: 35.h,
            radius: 28.r,
            btnName: 'Dropped',
            textColor: AppColor.black,
            bgColor: Color(0xffD6D6D6),
            onPressed: () {},
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
                btnName: 'WB34BW4479',
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
              MediumText(text: 'Mr Ram Lal Singh',fontSize: 14.sp,),
              IconAndTextButton(
                icon: LucideIcons.phone,
                iconSize: 18.r,
                cWidth: 110.w,
                cHeight: 35.h,
                radius: 10.r,
                btnName: 'Contact',
                bgColor: Colors.black,
                onPressed: () {
                  launch('tel:+91 6200783453');

                },
              ),

            ],
          )

        ],
      ),
    );
  }
}
