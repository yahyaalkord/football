import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/custom_calender.dart';

class CalenderDialog extends StatelessWidget {
  const CalenderDialog({
    Key? key,
    required this.focusedDay,
    required this.onDaySelected,
    required this.selectedDay,
  }) : super(key: key);
  final DateTime focusedDay;
  final void Function(DateTime, DateTime)? onDaySelected;
  final bool Function(DateTime) selectedDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Dialog(
        clipBehavior: Clip.antiAlias,
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        elevation: 0,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: Colors.transparent,
          ),
          height: 400.h,
          width: double.infinity,
          child: CustomCalender(
            focusedDay: focusedDay,
            onDaySelected: onDaySelected,
            selectedDay: selectedDay,
          ),
        ),
      ),
    );
  }
}
