import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerNewItem extends StatelessWidget {
  const PlayerNewItem({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.img,
    required this.dec,
    required this.date,
  }) : super(key: key);
  final void Function() onPressed;
  final String img;
  final String title;
  final String dec;
  final String date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsetsDirectional.only(
                start: 10.w, end: 10.w, top: 12.h, bottom: 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(bottom: 8.h),
                  width: double.infinity,
                  height: 123.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2.h),
                Text(
                  dec,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 89.h, start: 19.w),
            child: Container(
              width: 99.w,
              padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 3.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg_images/market.svg',
                    color: AppColors.primary,
                    width: 12,
                    height: 13,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    date,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
