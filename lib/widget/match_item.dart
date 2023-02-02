import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/widget/custom_button.dart';

class MatchItem extends StatelessWidget {
  const MatchItem({
    Key? key,
    required this.name,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.onPress,
  }) : super(key: key);
  final String name;
  final String date;
  final String startTime;
  final String endTime;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsetsDirectional.only(
            top: 12.h, bottom: 19.h, start: 15.w, end: 19.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r), color: AppColors.white),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyle.titleBlack),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 9.h, bottom: 11.h),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg_images/market.svg',
                        color: AppColors.primary,
                        width: 15.w,
                        height: 18.h,
                      ),
                      SizedBox(width: 7.w),
                      Text(
                        date,
                        style: AppTextStyle.headTitlePrimary,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg_images/time.svg',
                      color: AppColors.primary,
                      width: 17.w,
                      height: 17.h,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      '$startTime - $endTime',
                      style: AppTextStyle.headTitlePrimary,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
              onPressed: onPress,
            ),
          ],
        ),
      ),
    );
  }
}
