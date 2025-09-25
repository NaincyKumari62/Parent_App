import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/widgets/input_field/email_text_field.dart';

import '../../res/Colors/color.dart';
import '../../widgets/button/rounded_button.dart';
import '../../widgets/text/medium_text.dart';
import '../../widgets/text/small_text.dart';
import 'otp_verification.dart';
import 'otp_verification2.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
   TextEditingController emailController=TextEditingController();
   bool isChecked = false;



   @override
  void initState() {
    super.initState();
    emailController.addListener((){
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }
   bool isValidGmail(String email) {
     final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
     return regex.hasMatch(email.trim());
   }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(onPressed: (){
        }, icon: Icon(Icons.arrow_back)),
        title: Text('Verify OTP',style: TextStyle(
            fontSize: 20.sp,
            color: AppColor.black,
            fontWeight: FontWeight.w500
        ),),
      ),
      body:SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: 30.h),

                        MediumText(text: ' Email '),
                        SizedBox(height: 5.h),

                        EmailTextField(
                          emailController: emailController,
                        ),
                      SizedBox(height: 30.h,),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey.shade300,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Or continue with",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey.shade300,
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 15.h),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 7.w),
                          child: Container(
                            height: 45.h,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Image.asset("assets/images/google_logo.png",fit: BoxFit.cover),
                                  SizedBox(width: 5.w,),
                                  MediumText(text: "Continue with Google")
                                ],
                              ),
                            ),
                          ),
                        ),
                       Spacer(),
                        Row(children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                          ),
                          Text("I prefer email as my primary form of feedback and contact",style: TextStyle(fontSize: 10),)
                        ],),
                        CustomButton(
                          text: 'Continue',
                          onPressed:
                              () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpVerification2()));
                          },
                          bgColor: emailController.text.trim().endsWith('@gmail.com')
                              ? AppColor.black
                              : Colors.grey,
                        ),
                        SizedBox(height: 15.h,)


                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
