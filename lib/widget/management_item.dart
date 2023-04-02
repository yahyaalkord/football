import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/widget/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagementItem extends StatelessWidget {
  const ManagementItem({
    Key? key,
    required this.img,
    required this.name,
    required this.email,
    required this.onPressed,
    this.isData=false,
  }) : super(key: key);
  final String img;
  final String name;
  final String email;
  final bool isData;
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
              ),
        ),
        padding: EdgeInsetsDirectional.only(start: 8.w, end: 5.w),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: 95.w,
              height: 87.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                    color: AppColors.grey,
                    width: 1.5,
                    ),
              ),
              margin: EdgeInsets.symmetric(vertical: 8.h),
              child: isData?Image.network(img, fit: BoxFit.cover):Image.asset('assets/images/user3.png', fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 6.w,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: AppTextStyle.titleBlack,
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    email,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black),
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
