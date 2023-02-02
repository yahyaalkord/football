import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';

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
      padding: EdgeInsetsDirectional.only(
          start: 6.w, end: 5.w, top: 19.h, bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PUNISHMENT ${index + 1} :',
            style: AppTextStyle.titleBlack,
          ),
          SizedBox(height: 8.h),
          Text(
            desc,
            style: AppTextStyle.headTitleBlack,
          ),
        ],
      ),
    );
  }
}
