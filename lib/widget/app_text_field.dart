import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../helpers/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.label,
    this.hint,
    required this.keyboardType,
    required this.controller,
    this.focusedBorderColor = Colors.transparent,
    this.obscureText = false,
    this.suffixIcon,
    this.borderColor = AppColors.white,
    this.sizedBox = 8,
    this.height = 51,
    this.onSubmitted,
    this.onChange,
    this.isColumn = false,
    this.title,
    this.minLines,
    this.maxLines = 1,
    this.horizontalPad = 20,
    this.verticalPad = 0,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Color focusedBorderColor;
  final Widget? suffixIcon;
  final bool obscureText;
  final Color borderColor;
  final int sizedBox;
  final int height;
  final void Function(String)? onSubmitted;
  final Function(String value)? onChange;
  final String? title;
  final bool isColumn;
  final int? minLines;
  final int maxLines;
  final int horizontalPad;
  final int verticalPad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isColumn
            ? Text(title!,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black))
            : const SizedBox(),
        SizedBox(height: isColumn ? sizedBox.h : 0),
        SizedBox(
          height: height.h,
          width: double.infinity,
          child: TextField(
            minLines: minLines,
            maxLines: maxLines,
            cursorColor: AppColors.primary,
            cursorHeight: 20.h,
            textInputAction: TextInputAction.done,
            onSubmitted: onSubmitted,
            controller: controller,
            keyboardType: keyboardType,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            obscureText: obscureText,
            decoration: InputDecoration(
              fillColor: AppColors.white,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: horizontalPad.w,
                vertical: verticalPad.h
              ),
              labelText: label,
              hintText: hint,
              hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.black.withOpacity(0.30),
                fontWeight: FontWeight.w400,
              ),
              labelStyle: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.sameGrey,
                fontWeight: FontWeight.w500,
              ),
              hintMaxLines: 1,
              suffixIcon: CircleAvatar(
                  backgroundColor: Colors.transparent, child: suffixIcon),
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder:
                  buildOutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide(color: borderColor, width: 1),
    );
  }
}
