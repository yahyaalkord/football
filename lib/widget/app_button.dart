import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.borderColor = Colors.transparent,
    this.fontSize = 16,
    this.width = double.infinity,
    this.height = 48,
    this.radius = 20,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final double fontSize;
  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsetsDirectional.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.r),
          ),
          backgroundColor: backgroundColor,
          side: BorderSide(
            color: borderColor,
          ),
        ),
        onPressed: onPressed,
        child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
      ),
    );
  }
}
