import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavItem extends StatelessWidget {
  final void Function() onPressed;
  final String icon;
  final double height;
  final double width;
  final String title;
  bool isSelected;

  BottomNavItem({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.title,
    this.isSelected = false,
    this.width = 21,
    this.height = 21,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsetsDirectional.only(bottom: 9.h),
            constraints: const BoxConstraints(),
            onPressed: onPressed,
            icon: SvgPicture.asset(
              "assets/svg_images/$icon.svg",
              width: width,
              height: height,
              color: isSelected ? AppColors.primary : const Color(0xFFBBBBBB),
            ),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.black),
          ),
          SizedBox(height: 6.h),
          Visibility(
              visible: isSelected,
              child: CircleAvatar(
                radius: 3.r,
                backgroundColor: AppColors.primary,
              )),
        ],
      ),
    );
  }
}
