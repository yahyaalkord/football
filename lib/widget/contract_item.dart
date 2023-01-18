import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/widget/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class ContractItem extends StatelessWidget {
  const ContractItem({
    Key? key,
    required this.img,
    required this.name,
    required this.contYear,
    this.contYearColor = AppColors.primary,
    required this.about,
    required this.evaluation,
    required this.onPressed,
  }) : super(key: key);
  final String img;
  final String name;
  final String contYear;
  final Color contYearColor;
  final String about;
  final double evaluation;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.grey, width: 1.5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.h),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: 95.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(color: AppColors.grey),
                ),
                margin: EdgeInsets.symmetric(vertical: 8.h),
                child: Image.asset(img, fit: BoxFit.cover),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 6.w, top: 2.h, bottom: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black),
                          ),
                          const Spacer(),
                          Text(
                            contYear,
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: contYearColor),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.only(top: 11.h, bottom: 1.h),
                        child: Text(
                          'About the player:',
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary),
                        ),
                      ),
                      Text(
                        about,
                        style: GoogleFonts.poppins(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: AppColors.boldBlack),
                      ),
                      SizedBox(height: 11.h),
                      RichText(
                        softWrap: true,
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Player evaluation: ',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: evaluation.toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          end: 6.w,
          bottom: 18.h,
          child: CustomButton(
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
