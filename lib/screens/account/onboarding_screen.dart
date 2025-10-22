import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '../../res/Colors/color.dart';
import '../../widgets/button/rounded_button.dart';
import '../../widgets/file_box/upload_file_box.dart';
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
  int? selectedKidsCount;
  TextEditingController kidsCountController = TextEditingController();

  // Controllers
  final nameController = TextEditingController();


  Future<void> getImage(Function(File) onImagePicked) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      onImagePicked(File(pickedFile.path));
    }
  }

  String? phoneNumber;
  String? email;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      phoneNumber = prefs.getString('phoneNumber');
      email = prefs.getString('email');
    });
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal:16.w),
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
                SizedBox(width: 8.w),

                InputTextField(
                  isHintText: true,
                  suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                  readOly: true,
                  hintText: '+91 ${phoneNumber}',
                ),

                SizedBox(width: 8.sp),

                SizedBox(height: 5.h),

                BigText(
                  text: 'Email*',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  txtColor: Colors.black,
                ),

                SizedBox(height: 5.h),
                InputTextField(
                  suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                  isHintText: true,
                  readOly: true,
                  hintText: ' ${email}',
                ),

                SizedBox(height: 8.h),

                // Upload Photo
                MediumText(
                  text: "Aadhaar Card (back/front)",
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
                SizedBox(height: 10.h),
                UploadFileBox(
                  image: _image,
                  onTap: () => getImage((file) {
                    setState(() {
                      _image = file;
                    });
                  }),
                ),
                SizedBox(height: 10.h),
                MediumText(
                  text: "Kids Count*",
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
                SizedBox(
                  child: InputTextField(
                    controller: kidsCountController,
                    readOly: true,
                    suffixIcon: Builder(
                      builder: (context) {
                        return InkWell(
                          onTap: () async {
                            final RenderBox button = context.findRenderObject() as RenderBox;
                            final RenderBox overlay =
                            Overlay.of(context).context.findRenderObject() as RenderBox;

                            final RelativeRect position = RelativeRect.fromRect(
                              Rect.fromPoints(
                                button.localToGlobal(Offset(0, button.size.height),
                                    ancestor: overlay),
                                button.localToGlobal(button.size.bottomRight(Offset.zero),
                                    ancestor: overlay),
                              ),
                              Offset.zero & overlay.size,
                            );


                            final selected = await showMenu<int>(
                              context: context,
                              position: position,
                              color: Colors.white,
                              elevation: 6.0,
                              items: List.generate(10, (index) {
                                int value = index + 1;
                                return PopupMenuItem<int>(
                                  value: value,
                                  height: 35,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Center(
                                    child: Text(
                                      value.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );

                            if (selected != null) {
                              kidsCountController.text = selected.toString();
                            }
                          },
                          child: Icon(Icons.keyboard_arrow_down_sharp),
                        );
                      },
                    ),
                    hintText: '',
                  ),
                ),

                SizedBox(height: 16.h),

                CustomButton(
                  text: 'Save & Next',
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _image != null) {
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
                    } else {
                      if (_image == null) {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text('Please Upload Aadhaar card photo')),
                        // );
                      }
                    }
                  },
                  bgColor: AppColor.black,
                ),
                SizedBox(height: 28.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
