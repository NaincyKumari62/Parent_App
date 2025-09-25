import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../res/Colors/color.dart';
import '../../widgets/input_field/input_color_filed_text.dart';
import '../../widgets/text/big_text.dart';
import '../../widgets/text/medium_text.dart';

class BankDetailsScreen extends StatelessWidget {
  BankDetailsScreen({super.key});
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        title: BigText(text: 'Bank Details',txtColor: Color(0xff181C2E), fontSize: 20.sp,),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(15.r)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h,),
                      BigText(text: 'Bank Account Number',fontWeight: FontWeight.w400,fontSize: 16.sp,),
                      SizedBox(height: 3.h,),
                      InputColorFiledText(controller: nameController, hintText: '12345678901',fillColor: Colors.white,),

                      //bank holder
                      SizedBox(height: 15.h,),
                      BigText(text: 'Bank Account Holder Name',fontWeight: FontWeight.w400,fontSize: 16.sp,),
                      SizedBox(height: 3.h,),
                      InputColorFiledText(controller: nameController, hintText: 'John Doe',fillColor: Colors.white),

                      // bank name
                      SizedBox(height: 15.h,),
                      BigText(text: 'Bank Name',fontWeight: FontWeight.w400,fontSize: 16.sp,),
                      SizedBox(height: 3.h,),
                      InputColorFiledText(controller: nameController, hintText: 'State Bank of India',fillColor: Colors.white),


                      // branch name
                      SizedBox(height: 15.h,),
                      BigText(text: 'Branch Name',fontWeight: FontWeight.w400,fontSize: 16.sp,),
                      SizedBox(height: 3.h,),
                      InputColorFiledText(controller: nameController, hintText: 'Kolkata Main Branch',fillColor: Colors.white),

                      // IFSC Code
                      SizedBox(height: 15.h,),
                      BigText(text: 'IFSC Code',fontWeight: FontWeight.w400,fontSize: 16.sp,),
                      SizedBox(height: 3.h,),
                      InputColorFiledText(controller: nameController, hintText: 'SBIN0000123',fillColor: Colors.white),

                    ],
                  ),
                ),

                SizedBox(height: 15.h,),
                MediumText(text: '*To update any bank details please contact support',fontSize: 13.sp,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
