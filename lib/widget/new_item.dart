import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class NewItem extends StatelessWidget {
  const NewItem({
    Key? key,
    required this.img,
    required this.name,
    required this.dec,
    required this.onPressed,
  }) : super(key: key);
  final String img;
  final String name;
  final String dec;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
              color: AppColors.grey,
              width: 1.5,
              strokeAlign: StrokeAlign.outside),
        ),
        padding: EdgeInsetsDirectional.only(start: 10.w, end: 8.w),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: 94.w,
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.r),
              ),
              margin: EdgeInsets.symmetric(vertical: 15.h),
              child: Image.asset(img, fit: BoxFit.cover),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 7.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(name,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 7.h),
                      child: Text(
                        dec,
                        style: AppTextStyle.headTitleBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 7.w),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: AppColors.primary
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: onPressed,
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.white,
                  size: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
