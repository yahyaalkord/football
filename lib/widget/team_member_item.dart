import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/widget/custom_button.dart';

class TeamMemberItem extends StatelessWidget {
  const TeamMemberItem({
    Key? key,
    required this.img,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.evaluation,
    required this.onPressed,
  }) : super(key: key);
  final String img;
  final String name;
  final String startDate;
  final String endDate;
  final double evaluation;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.grey, width: 1.5, strokeAlign: StrokeAlign.outside),
        ),
        padding: EdgeInsetsDirectional.only(start: 8.w, end: 5.w),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: 95.w,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: AppColors.grey, width: 1.5, strokeAlign: StrokeAlign.outside),
              ),
              margin: EdgeInsets.symmetric(vertical: 8.h),
              child: Image.asset(img, fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 6.w, top: 2.h, bottom: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: AppTextStyle.titleBlack,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(top: 10.h, bottom: 14.h),
                    child: RichText(
                      softWrap: true,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Player evaluation:  ',
                        style: AppTextStyle.subTitlePrimary,
                        children: <TextSpan>[
                          TextSpan(
                            text: evaluation.toString(),
                            style: AppTextStyle.headTitleBlack,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 4.w),
                      SvgPicture.asset(
                        'assets/svg_images/market.svg',
                        color: AppColors.primary,
                        width: 14.w,
                        height: 16.h,
                      ),
                      SizedBox(width: 4.w),
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
                      SizedBox(width: 4.w),
                      Text(
                        endDate,
                        style: AppTextStyle.headTitlePrimary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
