import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/widget/custom_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 30.h,bottom: 60.h),
            child: Column(
              children: [
                CircleAvatar(
                    radius: 60.r,
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                    )),
                SizedBox(height: 10.h),
                Text(
                  'KSA Team',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black),
                ),
              ],
            ),
          ),
          CustomListTile(
            title: 'Edit Profile',
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 11.h),
            child: CustomListTile(
              title: 'Sponsers',
              onPressed: () {},
            ),
          ),
          CustomListTile(
            title: 'App Privacy',
            onPressed: () {},
          ),
          CustomListTile(
            title: 'About Us',
            onPressed: () {},
          ),
          CustomListTile(
            title: 'Contact Us',
            onPressed: () {},
            divider: false,
          ),
          SizedBox(height: 25.h),
        ],
      ),
    );
  }
}