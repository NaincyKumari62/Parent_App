import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../res/Colors/color.dart';
import '../../widgets/button/rounded_button.dart';
import '../../widgets/input_field/input_color_filed_text.dart';
import '../../widgets/text/big_text.dart';
import '../../widgets/text/medium_text.dart';
import '../bottom_nav_page/profile_screen.dart';


class EditProfileScreen extends StatelessWidget {
   EditProfileScreen({super.key});
 TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){}, icon: InkWell(onTap:(){
         Navigator.pop(context);
        },child: Icon(Icons.arrow_back))),
        title: BigText(text: 'Edit Profile',txtColor: Color(0xff181C2E), fontSize: 20.sp,),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // profile section
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        width: 140.w,
                        height: 140.w,
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/images/person.png',),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
            
            
                      Positioned(
                        bottom: 13.h,
                          right: 0,
                          child: Image.asset('assets/images/edit_icon.png'))
            
                    ],
                  ),
                ),
            
                SizedBox(height: 20.h,),
                BigText(text: 'FULL NAME',fontWeight: FontWeight.w400,fontSize: 16.sp,),
                SizedBox(height: 3.h,),
                InputColorFiledText(controller: nameController, hintText: 'Suman Mondal'),
                //email
                SizedBox(height: 15.h,),
                BigText(text: 'EMAIL',fontWeight: FontWeight.w400,fontSize: 16.sp,),
                SizedBox(height: 3.h,),
                InputColorFiledText(controller: nameController, hintText: 'mondalsuman97322@gmail.com'),
            
                // phone number
                SizedBox(height: 15.h,),
                BigText(text: 'PHONE NUMBER',fontWeight: FontWeight.w400,fontSize: 16.sp,),
                SizedBox(height: 3.h,),
                InputColorFiledText(controller: nameController, hintText: '+91 98328 00571'),


                // save button
                SizedBox(height: 15.h,),
               InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                   },
                   child: CustomButton(text: 'Save', onPressed: (){}, bgColor: Colors.black,cHeight: 50.h,))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
