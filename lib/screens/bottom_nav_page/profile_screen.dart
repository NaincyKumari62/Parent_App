
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/screens/bottom_nav_page/home_screen.dart';
import 'package:parent_app/screens/dashboard/dashboard_screen.dart';
import '../../res/Colors/color.dart';
import '../../widgets/Tile/custom_tile.dart';
import '../../widgets/text/big_text.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text("Profile"),
        leadingWidth: 35.w,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>DashboardScreen()));
          },
        ),
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
                  title: "Add New Kid",
                  onTap: () {

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
                  title: "Invoice History",
                  onTap: () {
                  },
                ),
                CustomTile(
                  imagePath: "assets/images/attendance_icon.png",
                  iconColor: Colors.red.shade900,
                  title: "Attendance Report",
                  onTap: () {
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
                  },
                ),
                CustomTile(
                  imagePath: "assets/images/legal_icon.png",
                  iconColor: Colors.red.shade900,
                  title: "Legal",
                  onTap: () {
                  },
                ),
                CustomTile(
                  imagePath: "assets/images/privacy_icon.png",
                  iconColor: Colors.grey.shade400,
                  title: "Privacy Policy",
                  onTap: () {
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
