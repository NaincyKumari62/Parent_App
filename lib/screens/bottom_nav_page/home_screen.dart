import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/screens/account/help_desk.dart';
import 'package:parent_app/widgets/button/rounded_button.dart';
import 'package:parent_app/widgets/driver_card/driver_card.dart';
import 'package:parent_app/widgets/driver_card/droped_card.dart';
import 'package:parent_app/widgets/text/big_text.dart';
import 'package:parent_app/widgets/text/medium_text.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../res/Colors/color.dart';
import '../account/pay_now_scren.dart';

void launchDialer(String phoneNumber) async {
  final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    print('Could not launch dialer');
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: Colors.white,
        title: ListTile(
          title: BigText(text: 'Welcome',fontSize: 24.sp,),
          subtitle: MediumText(
            text: 'Suresh Mahanti',
            fontSize: 16.sp,
            textAlign: TextAlign.start,
          ),
          trailing: CircleAvatar(
            backgroundImage: AssetImage('assets/images/person.png'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:5.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h,),
              DriverCard(),
              DropedCard(),

              //saving
              Container(
                margin: EdgeInsets.symmetric(vertical: 7.h, horizontal: 15.w),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColor.cardBgColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/leaf.png'),
                        SizedBox(width: 15.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: 'Carbon Savings this month: 5.4 kg',fontSize:16.sp,fontWeight: FontWeight.w500,),
                            MediumText(text: 'Equivalent to planting 0.3 trees',textAlign: TextAlign.start,txtColor: AppColor.grey_text,fontSize: 14,)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),

              //invoice
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColor.cardBgColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/wallet1.png'),
                        SizedBox(width: 15.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Invoice: ',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColor.grey,
                                      fontWeight: FontWeight.w500
                                    )
                                ),
                                TextSpan(
                                    text: ' ₹1,900',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.w700
                                    )
                                ),
                                TextSpan(
                                    text: ' (last paid) ',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        height: 1.5,
                                        color: Color(0xff808080),
                                        fontWeight: FontWeight.w400
                                    )
                                )

                                 ,TextSpan(
                                    text: '\nrecharge ends on 13th October, 2025 ',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        height: 1.5,
                                        color: Color(0xff808080),
                                        fontWeight: FontWeight.w400
                                    )
                                )

                              ]
                            )),
                            SizedBox(height: 8.h,),
                            Row(
                              children: [
                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>
                                      PaymentScreen()
                                      ));
                                    },
                                    child: BigText(text: 'Pay Now',txtColor: Color(0XFF175CC9),fontWeight: FontWeight.w500,fontSize: 16,)),
                                Icon(Icons.arrow_forward_ios_rounded,color: Color(0XFF175CC9),size: 18,)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
SizedBox(height: 15.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    CustomButton(
                      cWidth: 148.w,
                      text: 'Emergency SOS',
                      onPressed: () {
                        launch('tel:112'); // Replace with the emergency number you want
                      },
                      bgColor: Colors.red,
                    ),
                    SizedBox(width: 16.w,),
                    CustomButton(cWidth: 148.w, text: 'Contact Support', onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HelpScreen()
                        ),
                      );
                    }, bgColor: Colors.black)

                  ],
                ),
              ),
              SizedBox(height: 45.h,)
            ],
          ),
        ),
      ),
    );
  }
}
