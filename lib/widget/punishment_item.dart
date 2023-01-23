import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class PunishmentItem extends StatelessWidget {
  const PunishmentItem({
    Key? key,
    required this.index,
    required this.desc,
  }) : super(key: key);
  final int index;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 19.h, bottom: 8.h),
            child: Text(
              'PUNISHMENT ${index + 1} :',
              style: AppTextStyle.titleBlack,
            ),
          ),
          Text(
            desc,
            style: AppTextStyle.headTitleBlack,
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
