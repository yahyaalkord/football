import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/custom_floating_button.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: [
          StatsItem(
            title: 'Matches',
            count: 210,
            onPress: () => Navigator.pushNamed(context, '/matches_list_screen'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 38.h),
            child: const StatsItem(title: 'Awards', count: 47),
          ),
          const StatsItem(title: 'Violations', count: 12),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 20.h),
        child: CustomFloatingButton(
          onPressed: () => Navigator.pushNamed(context, '/add_match_screen'),
        ),
      ),
    );
  }
}
