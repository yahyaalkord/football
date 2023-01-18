import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/screen_model.dart';
import 'package:football/saff_screen/saff_punishment_screen.dart';
import 'package:football/saff_screen/teams_screen.dart';
import 'package:football/widget/bottom_nav_item.dart';

class SaffViewScreen extends StatefulWidget {
  const SaffViewScreen({Key? key}) : super(key: key);

  @override
  State<SaffViewScreen> createState() => _SaffViewScreenState();
}

class _SaffViewScreenState extends State<SaffViewScreen> {
  int selectedScreenIndex = 0;

  List<ScreenModel> screens = [
    ScreenModel(screen: const TeamsScreen()),
    ScreenModel(screen: const SaffPunishmentScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 87,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.16),
              blurRadius: 40,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavItem(
              title: 'Teams',
              onPressed: () {
                setState(() => selectedScreenIndex = 0);
              },
              icon: 'team',
              height: 23,
              width: 23,
              isSelected: selectedScreenIndex == 0,
            ),
            SizedBox(width: 10.w),
            BottomNavItem(
              title: 'Punishments',
              onPressed: () => setState(() => selectedScreenIndex = 1),
              icon: 'punishment',
              height: 23,
              width: 23,
              isSelected: selectedScreenIndex == 1,
            ),
          ],
        ),
      ),
      body: screens[selectedScreenIndex].screen,
    );
  }
}
