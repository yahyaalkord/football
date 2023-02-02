import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/widget/app_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(' Edit Profile'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primary,
            size: 22,
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsetsDirectional.only(end: 16.w),
            constraints: const BoxConstraints(),
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/svg_images/contract.svg",
              width: 20,
              height: 20,
              color: AppColors.primary,
            ),
          ),
        ],
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
          Padding(
            padding: EdgeInsetsDirectional.only(top: 11.h, bottom: 10.h),
            child: Center(
              child: AppButton(
                text: 'Change Profile Picture',
                onPressed: () {},
                fontSize: 12,
                width: 150,
                height: 28,
                radius: 8,
              ),
            ),
          ),
          Text(
            'Name:',
            style: AppTextStyle.headTitle,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 9.h, bottom: 9.h),
            child: Text(
              'Ahmed Ali',
              style: AppTextStyle.subTitle,
            ),
          ),
          Divider(
            height: 0,
            color: AppColors.grey,
            thickness: 1.5,
          ),
          SizedBox(height: 20.h),
          Text(
            'Email:',
            style: AppTextStyle.headTitle,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 9.h, bottom: 9.h),
            child: Text(
              'Ahmedali@gmail.com',
              style: AppTextStyle.subTitle,
            ),
          ),
          Divider(
            height: 0,
            color: AppColors.grey,
            thickness: 1.5,
          ),
          SizedBox(height: 20.h),
          Text(
            'Mobile:',
            style: AppTextStyle.headTitle,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 9.h, bottom: 9.h),
            child: Text(
              '+9665895432',
              style: AppTextStyle.subTitle,
            ),
          ),
          Divider(
            height: 0,
            color: AppColors.grey,
            thickness: 1.5,
          ),
          SizedBox(height: 20.h),
          Text(
            'Password:',
            style: AppTextStyle.headTitle,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 9.h, bottom: 9.h),
            child: Text(
              '*******',
              style: AppTextStyle.subTitle,
            ),
          ),
          Divider(
            height: 0,
            color: AppColors.grey,
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
