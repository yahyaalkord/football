import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDetails extends StatelessWidget {
  const CustomDetails({
    Key? key,
    required this.img,
    required this.name,
    required this.evaluation,
    required this.about,
  }) : super(key: key);
  final String img;
  final String name;
  final double evaluation;
  final String about;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
          start: 15.w, end: 15.w, top: 14.h, bottom: 14.h),
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.grey, width: 1.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(bottom: 3.h),
                  width: 98.w,
                  height: 97,
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
                  name,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.titleBlack,
                ),
                RichText(
                  softWrap: true,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Player evaluation: ',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: evaluation.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 17.h),
          Text(
            'About the player:',
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary),
          ),
          Text(
            about,
            style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.boldBlack),
          ),
        ],
      ),
    );
  }
}
