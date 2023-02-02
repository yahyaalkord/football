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
            padding: EdgeInsetsDirectional.only(top: 30.h, bottom: 60.h),
            child: Column(
              children: [
                Container(
                  width: 120.w,
                  height: 120.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Image(
                    image: AssetImage('assets/images/profile.png'),
                  ),
                ),
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
          CustomListTile(
            title: 'Sponsors',
            onPressed: () => Navigator.pushNamed(context, '/sponsor_screen'),
          ),
          CustomListTile(
            title: 'Matches',
            onPressed: () => Navigator.pushNamed(context, '/matches_list_screen'),
          ),
          CustomListTile(
            title: 'News',
            onPressed: () => Navigator.pushNamed(context, '/news_screen'),
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
