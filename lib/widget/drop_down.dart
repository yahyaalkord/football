import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/dropdow_model.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomDropdown<T> extends StatelessWidget {
  const   CustomDropdown({
    Key? key,
    required this.hint,
    required this.items,
    required this.valueTitle,
    required this.onChanged,
  }) : super(key: key);

  final String hint;
  final List<DropdownMenuItem<T>>? items;
  final T? valueTitle;
  final void Function(T?) onChanged;

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
          child: DropdownButton<T>(
            hint: Text(hint,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.sameGrey),
            ),
            isExpanded: true,
            underline: const SizedBox(),
            onChanged: onChanged,
            dropdownColor: AppColors.white,
            elevation: 1,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.boldBlack,
              size: 30,
            ),
            value: valueTitle,
            items: items,
          ),
        ),
      ],
    );
  }
}


/*class CustomDropdown extends StatefulWidget {
  CustomDropdown({
    Key? key,
    required this.hint,
    required this.itemsTitle,
    required this.valueTitle,
    required this.onPressed,
  }) : super(key: key);

  final String hint;
  final List<DropdownModel> itemsTitle;
  late int? valueTitle;
  final void Function() onPressed;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
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
            hint: Text(
              widget.hint,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.sameGrey),
            ),
            isExpanded: true,
            underline: const SizedBox(),
            onChanged: (int? value) {
              setState(() => widget.valueTitle = value!);
            },
            onTap: widget.onPressed,
            dropdownColor: AppColors.white,
            elevation: 1,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.boldBlack,
              size: 30,
            ),
            value: widget.valueTitle,
            items: widget.itemsTitle.map(
              (item) {
                return DropdownMenuItem<int>(
                  value: item.id,
                  child: Text(
                    item.title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
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
}*/
