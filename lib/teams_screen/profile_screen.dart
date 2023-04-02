import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/get/team_process_getx_controller.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/shared_pref_controller/shared_pref_controller.dart';
import 'package:football/widget/custom_list_tile.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api_controller/auth_api_controller.dart';
import '../helpers/api_response.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TeamProcessGetxController controller =TeamProcessGetxController.to;
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
                  SharedPrefController().getValueFor(key: PrefKeys.name.name),
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black),
                ),
              ],
            ),
          ),
          CustomListTile(
            title: 'Sponsors',
            onPressed: () => Navigator.pushNamed(context, '/sponsor_screen'),
          ),
          CustomListTile(
            title: 'Matches',
            onPressed: () =>
                Navigator.pushNamed(context, '/matches_list_screen'),
          ),
          CustomListTile(
            title: 'News',
            onPressed: () => Navigator.pushNamed(context, '/news_screen'),
          ),
          CustomListTile(
            title: 'App Privacy',
            onPressed: () => Navigator.pushNamed(context, '/privacy_screen'),
          ),
          CustomListTile(
            title: 'About Us',
            onPressed: () => Navigator.pushNamed(context, '/about_us_screen'),
          ),
          CustomListTile(
            title: 'Contact Us',
            onPressed: () => Navigator.pushNamed(context, '/contact_screen'),
            divider: true,
          ),
          CustomListTile(
            title: 'LogOut',
            onPressed: () async{
              ApiResponse apiResponse = await AuthApiController().logout();
              if (apiResponse.success) {
                Get.delete<TeamProcessGetxController>();
                Navigator.pushNamedAndRemoveUntil(context, '/login_as_screen', (route) => false);
              }
            },
            divider: false,
          ),
          SizedBox(height: 25.h),
        ],
      ),
    );
  }
}
