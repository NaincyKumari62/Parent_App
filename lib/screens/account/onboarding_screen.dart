import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parent_app/screens/account/login_screen.dart';
import 'package:parent_app/screens/splash_screen.dart';
import 'dart:io';
import '../../res/Colors/color.dart';
import '../../widgets/button/rounded_button.dart';
import '../../widgets/file_box/upload_file_box.dart';
import '../../widgets/input_field/email_text_field.dart';
import '../../widgets/input_field/input_text_field.dart';
import '../../widgets/text/big_text.dart';
import '../../widgets/text/medium_text.dart';
import 'onboarding_screen2.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  File? _image;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final kidsCountController = TextEditingController();
  final emailController = TextEditingController();

  String selectedState = 'Select State';

  Future<void> getImage(Function(File) onImagePicked) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      onImagePicked(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text("Onboarding"),
        leadingWidth: 35.w,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Guardian’s Details :',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),

              SizedBox(height: 5.h),

              BigText(
                text: 'Name*',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              InputTextField(
                isHintText: true,
                controller: nameController,
                hintText: 'Enter your full name of Guardian',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 5.h),

              BigText(
                text: 'Mobile* ',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              InputTextField(
                suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                controller: mobileController,
                isHintText: true,
                textInputType: TextInputType.number,
                hintText: '+91 9674****91',

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Mobile Number";
                  }
                  return null;
                },
              ),
              SizedBox(height: 5.h),

              BigText(
                text: 'Email*',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                txtColor: Colors.black,
              ),

              SizedBox(height: 5.h),

              EmailTextField(
                suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                emailController: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Email";
                  } else if (!value.contains('@')) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 6.h),

              // Upload Photo
              MediumText(
                text: "Aadhaar Card (back/front)",
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
              SizedBox(height: 6.h),
              UploadFileBox(
                image: _image,
                onTap: () => getImage((file) {
                  setState(() {
                    _image = file;
                  });
                }),
              ),
              SizedBox(height: 16.h),
              MediumText(
                text: "Kids Count*",
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),

              InputTextField(
                controller: kidsCountController,
                hintText: "How many kids would you like to enroll",

                textInputType: TextInputType.number,
                isHintText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Number of kids.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              CustomButton(
                text: 'Save & Next',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String kids = kidsCountController.text.trim();
                    int kidsCount = int.parse(kids);
                    int currentStu = 1;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OnboardingScreen2(
                          kids: kidsCount,
                          currentStu: currentStu,
                        ),
                      ),
                    );
                  }

                },
                bgColor: AppColor.black,
              ),
              SizedBox(height: 27.h),
            ],
          ),
        ),
      ),
    );
  }
}
