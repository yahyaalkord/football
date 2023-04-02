import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/widget/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerItem extends StatelessWidget {
  const PlayerItem({
    Key? key,
    required this.img,
    required this.name,
    this.contYearColor = AppColors.primary,
    required this.about,
    required this.evaluation,
    required this.onPressed,
    this.isData = false,
  }) : super(key: key);
  final String img;
  final String name;
  final Color contYearColor;
  final String about;
  final double evaluation;
  final void Function() onPressed;
  final bool isData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.grey, width: 1.5,),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: Row(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: 95.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: AppColors.grey, width: 15, ),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  child: isData?Image.network(img,height: double.infinity,fit: BoxFit.cover,) :Image.asset('assets/images/user2.png', fit: BoxFit.cover),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 6.w, top: 2.h, bottom: 2.h),
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
                          EdgeInsetsDirectional.only(top: 11.h, bottom: 1.h),
                          child: Text(
                            'About the player:',
                            style: AppTextStyle.subTitlePrimary,
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
                            style: AppTextStyle.subTitlePrimary,
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
      ),
    );
  }
}
