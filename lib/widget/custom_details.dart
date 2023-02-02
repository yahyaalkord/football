import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDetails extends StatelessWidget {
  const CustomDetails({
    Key? key,
    required this.img,
    required this.name,
    required this.evaluation,
    required this.startDate,
    required this.endDate,
    this.topPad = 14,
    this.bottomPad = 14,
    this.topHeight = 9,
    this.bottomHeight = 12,
  }) : super(key: key);
  final String img;
  final String name;
  final double evaluation;
  final String startDate;
  final String endDate;
  final int topPad;
  final int bottomPad;
  final int topHeight;
  final int bottomHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: topPad.h, bottom: 19.h),
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.grey, width: 1.5, strokeAlign: StrokeAlign.outside)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(bottom: bottomPad.h),
                  width: 98.w,
                  height: 110.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: AppColors.grey, width: 1.5, strokeAlign: StrokeAlign.outside),
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
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: topHeight.h, bottom: bottomHeight.h),
                  child: RichText(
                    softWrap: true,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Player evaluation: ',
                      style: AppTextStyle.headTitlePrimary,
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
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg_images/market.svg',
                color: AppColors.primary,
                width: 14.w,
                height: 16.h,
              ),
              SizedBox(width: 5.w),
              Text(
                startDate,
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
                'assets/svg_images/market.svg',
                color: AppColors.primary,
                width: 14.w,
                height: 16.h,
              ),
              SizedBox(width: 5.w),
              Text(
                endDate,
                style: AppTextStyle.headTitlePrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
