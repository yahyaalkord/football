import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomContract extends StatelessWidget {
  const CustomContract({
    Key? key,
    required this.img,
    required this.name,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);
  final String img;
  final String name;
  final String startDate;
  final String endDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: const Color(0xFFFDFDFD),
        border: Border.all(color: AppColors.grey, width: 1),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 9.h),
            width: 83.w,
            height: 99.h,
            child: Image.asset(
              img,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 7.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/svg_images/market.svg',
                      color: AppColors.primary,
                      width: 14.w,
                      height: 16.h,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      startDate,
                      style: AppTextStyle.headTitlePrimary,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        '-',
                        style: AppTextStyle.subTitlePrimary,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/svg_images/market.svg',
                      color: AppColors.primary,
                      width: 12.w,
                      height: 16.h,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      endDate,
                      style: AppTextStyle.headTitlePrimary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
