import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/shared_pref_controller/shared_pref_controller.dart';
import 'package:football/widget/app_button.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginAsScreen extends StatefulWidget {
  const LoginAsScreen({Key? key}) : super(key: key);

  @override
  State<LoginAsScreen> createState() => _LoginAsScreenState();
}

class _LoginAsScreenState extends State<LoginAsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          Image.asset(
            'assets/images/logo.png',
            height: 238.h,
            width: 238.w,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 20.h, bottom: 21.h),
            child: Text('Log in as you',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black)),
          ),
          AppButton(
            text: 'SAFF',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/saff_signin_screen');
              SharedPrefController().saveUserType(userType: 'admin');
            },
            width: 175,
            backgroundColor: AppColors.white,
            borderColor: AppColors.primary,
            textColor: AppColors.black,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: AppButton(
              text: 'Team',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/team_signin_screen');
                SharedPrefController().saveUserType(userType: 'team');
              },
              width: 175,
              backgroundColor: AppColors.white,
              borderColor: AppColors.primary,
              textColor: AppColors.black,
            ),
          ),
          AppButton(
            text: 'Player',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/player_signin_screen');
              SharedPrefController().saveUserType(userType: 'player');
            },
            width: 175,
            backgroundColor: AppColors.white,
            borderColor: AppColors.primary,
            textColor: AppColors.black,
          ),
          SizedBox(height: 8.h),
          AppButton(
            text: 'Visitor',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/visitor_signup_screen');
              SharedPrefController().saveUserType(userType: 'user');
            },
            width: 175,
            backgroundColor: AppColors.white,
            borderColor: AppColors.primary,
            textColor: AppColors.black,
          ),
        ],
      ),
    );
  }
}
