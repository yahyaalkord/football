import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';

class VisitorProfileScreen extends StatefulWidget {
  const VisitorProfileScreen({Key? key}) : super(key: key);

  @override
  State<VisitorProfileScreen> createState() => _VisitorProfileScreenState();
}

class _VisitorProfileScreenState extends State<VisitorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          Container(
            width: 130.w,
            height: 130.h,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Image(
              image: AssetImage('assets/images/profile2.png'),
            ),
          ),
          SizedBox(height: 54.h),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => Navigator.pushNamed(context, '/edit_profile_screen'),
            dense: true,
            title: Text(
              'Edit profile information',
              style: AppTextStyle.titlePrimary,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          Divider(
            color: AppColors.grey,
            thickness: 1.5,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            dense: true,
            title: Text(
              'Privacy',
              style: AppTextStyle.titlePrimary,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          Divider(
            color: AppColors.grey,
            thickness: 1.5,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => Navigator.pushReplacementNamed(context, '/visitor_signin_screen'),
            dense: true,
            title: Text(
              'Log Out',
              style: AppTextStyle.titlePrimary,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.primary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
