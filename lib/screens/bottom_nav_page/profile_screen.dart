
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../res/Colors/color.dart';
import '../../widgets/Tile/custom_tile.dart';
import '../../widgets/button/rounded_button.dart';
import '../../widgets/input_field/phone_number_field.dart';
import '../../widgets/text/big_text.dart';
import '../../widgets/text/medium_text.dart';
import '../../widgets/text/small_text.dart';
import '../profile_details/bank_details.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: BigText(text: "Profile",fontSize: 25.sp,txtColor:Color(0xff222222),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSection(
              context,
              tiles: [
                CustomTile(
                  imagePath: "assets/images/person_icon.png",
                  iconColor: AppColor.icon_person,
                  title: "Personal Info",
                  onTap: () {

                  },
                ),
                CustomTile(
                  imagePath: "assets/images/bank_icon.png",
                  iconColor: Colors.blue,
                  title: "Bank Details",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => BankDetailsScreen()),
                    );
                  },
                ),
                CustomTile(
                  imagePath: "assets/images/earn_icon.png",
                  iconColor: Colors.yellow.shade900,
                  title: "Refer & Earn",
                  onTap: () {

                  },
                ),
                CustomTile(
                  imagePath: "assets/images/salery.png",
                  iconColor: Colors.purple.shade900,
                  title: "Salary Slips",
                  onTap: () {
                    // TODO: Implement navigation
                  },
                ),
                CustomTile(
                  imagePath: "assets/images/attendance_icon.png",
                  iconColor: Colors.red.shade900,
                  title: "Attendance Report",
                  onTap: () {
                    // TODO: Implement navigation
                  },
                ),
              ],
            ),


            _buildSection(
              context,
              tiles: [
                CustomTile(
                  imagePath: "assets/images/terms_condition_icon.png",
                  iconColor: Colors.green.shade700,
                  title: "Terms & Conditions",
                  onTap: () {
                    // TODO: Implement navigation
                  },
                ),
                CustomTile(
                  imagePath: "assets/images/legal_icon.png",
                  iconColor: Colors.red.shade900,
                  title: "Legal",
                  onTap: () {
                    // TODO: Implement navigation
                  },
                ),
                CustomTile(
                  imagePath: "assets/images/privacy_icon.png",
                  iconColor: Colors.grey.shade400,
                  title: "Privacy Policy",
                  onTap: () {
                    // TODO: Implement navigation
                  },
                ),
              ],
            ),
            _buildSection(
              context,
              tiles: [
                CustomTile(
                  imagePath: "assets/images/logout_icon.png",
                  iconColor: Colors.red.shade900,
                  title: "Log Out",
                  onTap: () {

                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each section with common styling
  Widget _buildSection(BuildContext context, {required List<Widget> tiles}) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: tiles),
    );
  }
}
