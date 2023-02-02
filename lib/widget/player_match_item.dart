import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerMatchItem extends StatelessWidget {
  const PlayerMatchItem({
    Key? key,
    required this.img,
    required this.name,
    required this.date,
    required this.time,
    required this.stadiumName,
    required this.refereeName,
  }) : super(key: key);
  final String img;
  final String name;
  final String date;
  final String time;
  final String stadiumName;
  final String refereeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(end: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: const Color(0xFFFDFDFD),
        border: Border.all(color: AppColors.grey, width: 1),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 31.h),
            width: 83.w,
            height: 70.h,
            child: Image.asset(
              img,
              fit: BoxFit.cover,
            ),
          ),
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svg_images/market.svg',
                        color: AppColors.primary,
                        width: 14.w,
                        height: 17.h,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        date,
                        style: AppTextStyle.headTitlePrimary,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          '-',
                          style: AppTextStyle.subTitlePrimary,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/svg_images/time_circle.svg',
                        color: AppColors.primary,
                        width: 16.w,
                        height: 17.h,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        time,
                        style: AppTextStyle.headTitlePrimary,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      stadiumName,
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      refereeName,
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
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
