import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class SaffPunishmentItem extends StatelessWidget {
  const SaffPunishmentItem({
    Key? key,
    required this.index,
    required this.desc,
    required this.For,
    required this.onDeletePress,
    required this.onEditPress,
  }) : super(key: key);
  final int index;
  final String desc;
  final String For;
  final void Function() onDeletePress;
  final void Function() onEditPress;

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
            child: Row(
              children: [
                Text(
                  'PUNISHMENT ${index + 1} :',
                  style: AppTextStyle.titleBlack,
                ),
                const Spacer(),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: onEditPress,
                    icon: SvgPicture.asset(
                      'assets/svg_images/edit.svg',
                    )),
                SizedBox(width: 9.w),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: onDeletePress,
                    icon: SvgPicture.asset(
                      'assets/svg_images/delete.svg',
                    )),
                SizedBox(width: 3.w),
              ],
            ),
          ),
          Text(
            desc,
            style: AppTextStyle.headTitleBlack,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 4.h,bottom: 12.h),
            child: Text(
              'For: $For',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
