

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/Colors/color.dart';
import '../../widgets/button/rounded_button.dart';
import '../../widgets/input_field/phone_number_field.dart';
import '../../widgets/text/medium_text.dart';
import '../../widgets/text/small_text.dart';
import 'otp_verification.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneController.addListener((){
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }@override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SizedBox(height: 40.h),

                        Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset('assets/images/vehicle.png'),
                        ),

                         SizedBox(height: 30.h),

                        MediumText(text: 'Enter Your Phone Number'),
                         SizedBox(height: 5.h),

                        PhoneNumberField(
                          phoneController: phoneController,
                        ),

                         SizedBox(height: 30.h),

                        CustomButton(
                          text: 'Continue',
                          onPressed: () async {
                            if (phoneController.text.trim().length == 10) {
                              SharedPreferences prefs =  await SharedPreferences.getInstance();
                              await prefs.setString('phoneNumber', phoneController.text.trim());

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => OtpVerification()),
                              );
                            }
                          },
                          bgColor: phoneController.text.trim().length == 10
                              ? AppColor.black
                              : Colors.grey,
                        ),

                         Spacer(), // Pushes SmallText to the bottom

                        SmallText(
                          text:
                          '''By signing up you agree to our terms and conditions. \nLearn how to use your data in our Privacy Policy.''',
                        ),
                         SizedBox(height: 20.h),
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
