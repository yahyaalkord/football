import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';

class CustomMatchDetails extends StatelessWidget {
  const CustomMatchDetails({
    Key? key,
    required this.teamName,
    required this.stadiumName,
    required this.refereeName,
    required this.date,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);
  final String teamName;
  final String stadiumName;
  final String refereeName;
  final String date;
  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      margin: EdgeInsetsDirectional.only(top: 25.h),
      padding: EdgeInsetsDirectional.only(
          top: 16.h, bottom: 19.h, start: 16.w, end: 16.w),
      child: Column(
        children: [
          Text(teamName, style: AppTextStyle.titleBlack),
          SizedBox(height: 14.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stadiumName,
                    style: AppTextStyle.titleBlack,
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg_images/market.svg',
                        color: AppColors.primary,
                        width: 18.w,
                        height: 20.h,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        date,
                        style: AppTextStyle.headTitlePrimary,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.only(top: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      refereeName,
                      style: AppTextStyle.titleBlack,
                    ),
                    SizedBox(height: 34.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg_images/time.svg',
                          color: AppColors.primary,
                          width: 20.w,
                          height: 20.h,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          '$startTime  $endTime',
                          style: AppTextStyle.headTitlePrimary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
