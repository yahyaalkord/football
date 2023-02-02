import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('App Privacy'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        child: ListView(
          children: [
            Text(
              '1. Agreement',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 10.h, bottom: 25.h),
              child: Text(
                'Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.sameGrey,
                ),
              ),
            ),
            Text(
              '2. Account',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 10.h, bottom: 25.h),
              child: Text(
                'Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.sameGrey,
                ),
              ),
            ),
            Text(
              '3. Relationship With Clubs',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 10.h, bottom: 25.h),
              child: Text(
                'Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis ',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.sameGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
