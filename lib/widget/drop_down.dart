import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/dropdow_model.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownPunishment extends StatefulWidget {
  DropdownPunishment({
    Key? key,
    required this.itemsTitle,
    required this.valueTitle,
    required this.onPressed,
  }) : super(key: key);

  final List<DropdownModel> itemsTitle;
  late int? valueTitle;
  final void Function() onPressed;

  @override
  State<DropdownPunishment> createState() => _DropdownPunishmentState();
}

class _DropdownPunishmentState extends State<DropdownPunishment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          height: 51.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.white,
          ),
          child: DropdownButton<int>(
            hint: Text('team name',style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.black.withOpacity(0.30)),),
            isExpanded: true,
            underline: const SizedBox(),
            onChanged: (int? value) {
              setState(() => widget.valueTitle = value!);
            },
            onTap: widget.onPressed,
            dropdownColor: AppColors.white,
            elevation: 1,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.boldBlack,
              size: 30,
            ),
            value: widget.valueTitle,
            items: widget.itemsTitle.map(
                  (item) {
                return DropdownMenuItem<int>(
                  value: item.id,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 12.w),
                    child: Text(
                      item.title,
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}