import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class playerNewDetItem extends StatelessWidget {
  const playerNewDetItem({
    Key? key,
    required this.img,
    required this.title,
    required this.date,
    required this.dec,
  }) : super(key: key);
  final String img;
  final String title;
  final String date;
  final String dec;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: 233.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.r),
            color: const Color(0xFFE6E6E6),
          ),
          child: Image.asset(
            img,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(top: 40.h, bottom: 13.h),
          child: Row(
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/svg_images/market.svg',
                color: AppColors.primary,
                width: 15.w,
                height: 17.h,
              ),
              SizedBox(width: 5.w),
              Text(
                date,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Text(
          dec,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
