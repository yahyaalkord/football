import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/widget/stats_item.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STATS'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 25.h),
        children: [
          const StatsItem(title: 'Matches', count: 210),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 38.h),
            child: const StatsItem(title: 'Awards', count: 47),
          ),
          const StatsItem(title: 'Violations', count: 12),
        ],
      ),
      floatingActionButton:
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: 20.h),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_match_screen');
              },
              backgroundColor: AppColors.primary,
              elevation: 0,
              child: const Icon(
                Icons.add,
                size: 42,
              ),
            ),
          ),
    );
  }
}

