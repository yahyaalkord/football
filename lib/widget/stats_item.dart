import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/app_colors.dart';

class StatsItem extends StatelessWidget {
  const StatsItem({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 31.h, bottom: 10.h),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
          ),
          Text(
            count.toString(),
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
