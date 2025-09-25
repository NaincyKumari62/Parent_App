
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../res/Colors/color.dart';
import '../../widgets/text/big_text.dart';
import '../../widgets/text/medium_text.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: BigText(text: 'Help Desk', fontSize: 20.sp),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediumText(
              text: "We’re here to help you with anything and everything on GrnLYFT",
              fontSize: 17.sp,
              textAlign: TextAlign.start,
              txtColor: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 20.h),

            /// FAQ Section
            Text("FAQs", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.h),

            _faqItem(
              "Can I mark attendance/check-in for each\nchild during pickup and drop-off?",
            ),
            _faqItem(
              "Can I communicate with parents?",
            ),
            _faqItem(
              "How do I track my earnings, bonuses, and\npayouts within the app?",
            ),
            _faqItem(
              "How can I view my assigned route and list\nof student stops in real time?",
            ),

            SizedBox(height: 30.h),

            /// Contact Section
            Text("Contact Support", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.h),

            Row(
              children: [
                Image.asset("assets/images/call.png", color: AppColor.black),
                SizedBox(width: 10.w),
                Text("+91 9548268651", style: TextStyle(fontSize: 14.sp)),
              ],
            ),
            SizedBox(height: 10.h),

            Row(
              children: [
                FaIcon(FontAwesomeIcons.whatsapp, size: 20.sp),
                SizedBox(width: 10.w),
                Text("+91 9256386451", style: TextStyle(fontSize: 14.sp)),
              ],
            ),
            SizedBox(height: 10.h),

            Row(
              children: [
                Icon(Icons.email_outlined, size: 20.sp),
                SizedBox(width: 10.w),
                Text("info@grnlyft.com", style: TextStyle(fontSize: 14.sp)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Helper widget for FAQ item
  Widget _faqItem(String question) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  question,
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
              Icon(Icons.add, color: Colors.grey, size: 20.sp),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(height: 1),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
