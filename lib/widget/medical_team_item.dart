import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/widget/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalTeamItem extends StatelessWidget {
  const MedicalTeamItem({
    Key? key,
    required this.img,
    required this.name,
    required this.email,
    required this.specialization,
    required this.onPressed,
  }) : super(key: key);
  final String img;
  final String name;
  final String email;
  final String specialization;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
              color: AppColors.grey,
              width: 1.5,
              strokeAlign: StrokeAlign.outside),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 9.h),
                    child: Text(
                      email,
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black.withOpacity(0.50)),
                    ),
                  ),
                  RichText(
                    softWrap: true,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Specialization: ',
                      style: AppTextStyle.subTitlePrimary,
                      children: <TextSpan>[
                        TextSpan(
                          text: specialization,
                          style: AppTextStyle.headTitleBlack,
                        ),
                      ],
                    ),
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
