
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/screens/account/email_verification_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../res/Colors/color.dart';
import '../../widgets/button/rounded_button.dart';
import '../../widgets/text/medium_text.dart';
import 'onboarding_screen.dart';

class OtpVerification2 extends StatefulWidget {
  const OtpVerification2({super.key});

  @override
  State<OtpVerification2> createState() => _OtpVerification2State();
}

class _OtpVerification2State extends State<OtpVerification2> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  late String otp;


  @override
  void initState() {
    super.initState();

    _otpController.addListener((){
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailVerificationScreen()));
        }, icon: Icon(Icons.arrow_back)),
        title: Text('Verify OTP',style: TextStyle(
            fontSize: 20.sp,
            color: AppColor.black,
            fontWeight: FontWeight.w500
        ),),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              MediumText(text: 'Enter the OTP Sent to your Email ',fontSize: 14.sp,fontWeight: FontWeight.w400,),
              SizedBox(height: 10.h),
              Form(
                key: _formKey,
                child: PinCodeTextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  appContext: context,
                  length: 6,
                  onChanged: (value) {
                    otp =value;
                  },
                  validator: (value){
                    if(value == null || value.isEmpty || value.length < 6){
                      return "Please enter a valid 6-digit OTP";
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10.r),
                    fieldHeight: 40.h,
                    fieldWidth: 43.w,
                    inactiveFillColor: AppColor.white,
                    selectedFillColor: AppColor.white,
                    activeFillColor:AppColor.white,
                    inactiveColor: AppColor.otpBoxBorder,
                    selectedColor:AppColor.otpBoxBorder,
                    activeColor:AppColor.otpBoxBorder,
                  ),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                ),
              ),
        
Spacer(),
              CustomButton(text: 'Verify', onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen()));
              }, bgColor: _otpController.text.length == 6? Colors.black:Colors.grey,),
              SizedBox(height: 30.h,)
            ],
          ),
        ),
      ),
    );
  }
}
