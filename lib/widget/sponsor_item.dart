import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SponsorItem extends StatelessWidget {
  const SponsorItem({Key? key, required this.img, required this.name})
      : super(key: key);
  final String img;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: 15.h, bottom: 12.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFBBBBBB),
        ),
        borderRadius: BorderRadius.circular(10.r),
        color: const Color(0xFFFDFDFD).withOpacity(0.30),
      ),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsetsDirectional.only(bottom: 11.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19.r),
            ),
            width: 93.w,
            height: 102.h,
            child: Image.asset(
              img,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            name,
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
