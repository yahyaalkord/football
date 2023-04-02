import 'package:flutter/material.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalender extends StatefulWidget {
  const CustomCalender({
    Key? key,
    required this.focusedDay,
    required this.onDaySelected,
    required this.selectedDay,
  }) : super(key: key);
  final DateTime focusedDay;
  final void Function(DateTime, DateTime)? onDaySelected;
  final bool Function(DateTime) selectedDay;

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: double.infinity,
        ),
        child: TableCalendar(
          calendarStyle: const CalendarStyle(
            selectedDecoration: BoxDecoration(
                color: AppColors.primary, shape: BoxShape.circle),
              todayDecoration: BoxDecoration(
                  color: AppColors.primary, shape: BoxShape.circle)),
          locale: 'en_US',
          rowHeight: 43,
          headerStyle: const HeaderStyle(
              formatButtonVisible: false, titleCentered: true),
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: widget.selectedDay,
          focusedDay: widget.focusedDay /*today*/,
          firstDay: DateTime.utc(1950, 12, 1),
          lastDay: DateTime.utc(2030, 12, 1),
          onDaySelected: widget.onDaySelected,
          // },
        ));
  }
}
