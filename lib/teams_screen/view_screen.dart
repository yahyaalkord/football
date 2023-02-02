import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/screen_model.dart';
import 'package:football/teams_screen/contract_screen.dart';
import 'package:football/teams_screen/market_screen.dart';
import 'package:football/teams_screen/profile_screen.dart';
import 'package:football/teams_screen/punishment_screen.dart';
import 'package:football/teams_screen/stats_screen.dart';
import 'package:football/widget/bottom_nav_item.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  int selectedScreenIndex = 0;

  List<ScreenModel> screens = [
    ScreenModel(screen: const StatsScreen()),
    ScreenModel(screen: const ContractScreen()),
    ScreenModel(screen: const MarketScreen()),
    ScreenModel(screen: const PunishmentScreen()),
    ScreenModel(screen: const ProfileScreen()),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavItem(
              title: 'Stats',
              onPressed: () {
                setState(() => selectedScreenIndex = 0);
              },
              icon: 'stats',
              isSelected: selectedScreenIndex == 0,
            ),
            BottomNavItem(
              title: 'Contracts',
              onPressed: () => setState(() => selectedScreenIndex = 1),
              icon: 'contract',
              isSelected: selectedScreenIndex == 1,
            ),
            BottomNavItem(
              title: 'Market',
              onPressed: () {
                setState(() => selectedScreenIndex = 2);
              },
              icon: 'market',
              isSelected: selectedScreenIndex == 2,
            ),
            BottomNavItem(
              title: 'Punishments',
              onPressed: () => setState(() => selectedScreenIndex = 3),
              icon: 'punishment',
              isSelected: selectedScreenIndex == 3,
            ),
            BottomNavItem(
              title: 'Profile',
              onPressed: () {
                setState(() => selectedScreenIndex = 4);
              },
              icon: 'profile',
              isSelected: selectedScreenIndex == 4,
            ),
          ],
        ),
      ),
      body: screens[selectedScreenIndex].screen,
    );
  }
}
