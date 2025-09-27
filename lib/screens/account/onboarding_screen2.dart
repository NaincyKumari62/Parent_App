import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../res/Colors/color.dart';
import '../../widgets/button/rounded_button.dart';
import '../../widgets/file_box/upload_file_box.dart';
import '../../widgets/input_field/input_text_field.dart';
import '../../widgets/text/big_text.dart';
import '../../widgets/text/medium_text.dart';

class OnboardingScreen2 extends StatefulWidget {
  final int kids;
   int currentStu;
 OnboardingScreen2({super.key, required this.kids, required this.currentStu});

  @override
  _OnboardingScreen2State createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  File? _image;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final dobController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final postalController = TextEditingController();
  final bankAccountController = TextEditingController();
  final holderNameController = TextEditingController();
  final bankNameController = TextEditingController();
  final branchNameController = TextEditingController();
  final ifscController = TextEditingController();
  final schoolNameController=TextEditingController();


  TimeOfDay? startTime;
  TimeOfDay? endTime;

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          startTime = pickedTime;
          startTimeController.text = pickedTime.format(context);
        } else {
          endTime = pickedTime;
          endTimeController.text = pickedTime.format(context);
        }
      });
    }
  }


  String? selectedAge;
  String? selectedGender;

  Future<void> getImage(Function(File) onImagePicked) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      onImagePicked(File(pickedFile.path));
    }
  }

  List<String> ageList = List.generate(43, (index) => (index + 5).toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: BigText(text: "Onboarding",fontSize: 22.sp,),
        leadingWidth: 35.w,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal:  18.w,vertical: 10.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.currentStu}st Student Details :',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 10.h),

              // Upload Photo
              MediumText(
                text: "Upload school ID Card photo",
                fontWeight: FontWeight.w400,
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
              SizedBox(height: 16.h),

              // Name
              BigText(text: 'Name*', fontSize: 16.sp, fontWeight: FontWeight.w500),
              InputTextField(
                isHintText: true,
                controller: nameController,
                hintText: 'Enter your full name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),


              // DOB
              BigText(
                text: 'Date of Birth*',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              InputTextField(
                controller: dobController,
                suffixIcon: Icon(Icons.calendar_month),
                isHintText: true,
                textInputType: TextInputType.datetime,
                hintText: 'DD/MM/YYYY',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Date of Birth";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              // Age + Gender
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: 'Age*',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 8.h),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintText: 'Age',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: AppColor.onboardingBorder,
                                width: 1.w,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: AppColor.onboardingBorder,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                          ),
                          icon: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.keyboard_arrow_up, size: 17),
                              Icon(Icons.keyboard_arrow_down, size: 17),
                            ],
                          ),

                          value: selectedAge,
                          items: ageList.map((age) {
                            return DropdownMenuItem<String>(
                              value: age,
                              child: Text(age),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedAge = value;
                            });
                          },
                          validator: (value) =>
                          value == null ? "Please select Age" : null,
                        ),
                      ],
                    ),
                  )
                  ,


                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: 'Gender*', fontSize: 16.sp, fontWeight: FontWeight.w500),

                        DropdownButtonFormField<String>(
                          value: selectedGender,
                          decoration: InputDecoration(
                            hintText: 'Select',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide:  BorderSide(
                                color: AppColor.onboardingBorder,
                                width: 1.w,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1.r),
                              borderSide:  BorderSide(
                                color: AppColor.onboardingBorder,
                                width: 1.w,
                              ), // focused border color
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: const BorderSide(
                                color: AppColor.onboardingBorder,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                          ),
                          items: [
                            'Male',
                            'Female',
                            'Transgender',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                          validator: (value) =>
                          value == null ? "Please select Gender" : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              // Pickup Address
              Text(
                "Pickup & Drop Address*",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InputTextField(
                controller: address1Controller,
                hintText: 'Line1',
                isHintText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Residential Address";
                  }
                  return null;
                },
              ),
              SizedBox(height: 5.h),
              InputTextField(
                controller: address2Controller,
                hintText: 'Postal Code',
                isHintText: true,
              ),
              SizedBox(height: 5.h),

              // School name
              BigText(
                text: "School Name*",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              InputTextField(
                hintText: "Enter your child’s school name",
                controller: schoolNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter your child school name";
                  }
                  return null;
                },
              ),
              // School Hours
              BigText(
                text: "School Hours*",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),


              Row(
                children: [
                  // Start Time
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectTime(context, true),
                      child: AbsorbPointer(
                        child: InputTextField(
                          controller: startTimeController, hintText: 'Start Time',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Select start time';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Text(" - "),

                  // End Time
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectTime(context, false),
                      child: AbsorbPointer(
                        child: InputTextField(
                          controller: endTimeController,
                          hintText: 'End Time',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Select end time';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),








SizedBox(height: 10.h,),

              Text(
                "Pickup & Drop Address*",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InputTextField(
                controller: address1Controller,
                hintText: 'Line1',
                isHintText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Residential Address";
                  }
                  return null;
                },
              ),
              SizedBox(height: 5.h),
              InputTextField(
                controller: address2Controller,
                hintText: 'Postal Code',
                isHintText: true,
              ),



              SizedBox(height: 24.h),
              CustomButton(
                text: 'Save & Next',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //  form valid hua to agla page open hoga
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Form Submitted Successfully")),
                    );
                    if(widget.currentStu<widget.kids){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen2(kids: widget.kids, currentStu: widget.currentStu)));
                    }

                  }
                  if(widget.currentStu<widget.kids){
                    int currentStu = widget.currentStu+1;
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen2(kids: widget.kids, currentStu: currentStu)));
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
