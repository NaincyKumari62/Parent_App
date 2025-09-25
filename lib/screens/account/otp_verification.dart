
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../res/Colors/color.dart';
import '../../widgets/button/rounded_button.dart';
import '../../widgets/input_field/phone_number_field.dart';
import '../../widgets/text/medium_text.dart';
import '../../widgets/text/small_text.dart';
import 'login_screen.dart';
import 'otp_verification.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {

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
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        }, icon: Icon(Icons.arrow_back)),
        title: Text('Verify OTP',style: TextStyle(
          fontSize: 20.sp,
          color: AppColor.black,
          fontWeight: FontWeight.w500
        ),),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h),
            MediumText(text: 'Enter the OTP Sent to your mobile number',fontSize: 14,fontWeight: FontWeight.w400,),
            SizedBox(height: 10.h),
            Form(
              key: _formKey,
              child: PinCodeTextField(
                controller: _otpController,
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

            SizedBox(height: 20.h),

            CustomButton(text: 'Verify', onPressed: () {
          //    Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen()));
            }, bgColor: _otpController.text.length == 6? Colors.black:Colors.grey,)
          ],
        ),
      ),
    );
  }
}
