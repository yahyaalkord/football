import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamItem extends StatelessWidget {
  const TeamItem({
    Key? key,
    required this.teamName,
    required this.mobile,
    required this.playerNo,
    required this.onPress,
    required this.onDeletePress,
    required this.onEditPress,
  }) : super(key: key);
  final String teamName;
  final String mobile;
  final int playerNo;
  final void Function() onPress;
  final void Function() onDeletePress;
  final void Function() onEditPress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        InkWell(
          onTap: onPress,
          child: Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.only(
                start: 17.w, end: 11.w, top: 13.h, bottom: 13.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.16),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  softWrap: true,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Team Name: ',
                    style: AppTextStyle.titleBlack,
                    children: <TextSpan>[
                      TextSpan(
                        text: teamName,
                        style: AppTextStyle.titlePrimary,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: RichText(
                    softWrap: true,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Team Mobile: ',
                      style: AppTextStyle.titleBlack,
                      children: <TextSpan>[
                        TextSpan(
                          text: mobile,
                          style: AppTextStyle.titlePrimary,
                        ),
                      ],
                    ),
                  ),
                ),
                RichText(
                  softWrap: true,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Team Players: ',
                    style: AppTextStyle.titleBlack,
                    children: <TextSpan>[
                      TextSpan(
                        text: playerNo.toString(),
                        style: GoogleFonts.poppins(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          end: 11.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: onEditPress,
                  icon: SvgPicture.asset(
                    'assets/svg_images/edit.svg',
                  )),
              SizedBox(width: 9.w),
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: onDeletePress,
                  icon: SvgPicture.asset(
                    'assets/svg_images/delete.svg',
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
