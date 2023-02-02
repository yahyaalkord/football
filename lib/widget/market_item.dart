import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/widget/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class MarketItem extends StatelessWidget {
  const MarketItem({
    Key? key,
    required this.img,
    required this.name,
    required this.decContract,
    required this.color,
    required this.evaluation,
    required this.onPressed,
  }) : super(key: key);
  final String img;
  final String name;
  final String decContract;
  final Color color;
  final double evaluation;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
              color: color,
              width: 1,
              strokeAlign: StrokeAlign.outside),
        ),
        padding: EdgeInsetsDirectional.only(start: 8.w, end: 10.w),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: 75.w,
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                    color: AppColors.grey,
                    width: 1.5,
                    strokeAlign: StrokeAlign.outside),
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
                    padding: EdgeInsets.symmetric(vertical: 7.h),
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
                  Text(
                    decContract,
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: color),
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
