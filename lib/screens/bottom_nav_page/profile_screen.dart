
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../res/Colors/color.dart';
import '../../widgets/Tile/custom_tile.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text("Profile",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w500),),
        leadingWidth: 40.w,
        leading: Padding(
          padding:  EdgeInsets.only(left: 10.w),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSection(
              context,
              tiles: [
                CustomTile(
                  icon: LucideIcons.user,
                  iconColor: AppColor.icon_person,
                  title: 'Personal Info',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen() ));
                  },
                ),

                CustomTile(
                  icon: LucideIcons.smile_plus,
                  iconColor: AppColor.icon_smile,
                  title: "Add New Kid",
                  onTap: () {

                  },
                ),
                CustomTile(
                  icon: LucideIcons.gift,
                  iconColor: AppColor.icon_gift,
                  title: "Refer & Earn",
                  onTap: () {

                  },
                ),
                CustomTile(
                  icon: LucideIcons.receipt_text,
                  iconColor: AppColor.icon_slip,
                  title: "Voice History",
                  onTap: () {

                  },
                ),
                CustomTile(
                  icon: LucideIcons.receipt_text,
                  iconColor: AppColor.icon_slip,
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
                  icon: LucideIcons.file_text,
                  iconColor:  AppColor.icon_terms,
                  title: "Terms & Conditions",
                  onTap: () {
                  },
                ),
                CustomTile(
                  icon: LucideIcons.scale,
                  iconColor: AppColor.icon_legal,
                  title: "Legal",
                  onTap: () {
                  },
                ),
                CustomTile(
                  icon: LucideIcons.file_key,
                  iconColor: AppColor.icon_privacy,
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
                  icon: LucideIcons.log_out,
                  iconColor: AppColor.icon_logout,
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
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(children: tiles),
    );
  }
}
