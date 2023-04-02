import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/screen_model.dart';
import 'package:football/player_screen/matches_screen.dart';
import 'package:football/player_screen/player_contracts_screen.dart';
import 'package:football/player_screen/player_news_screen.dart';
import 'package:football/player_screen/player_profile_screen.dart';
import 'package:football/player_screen/stars_player_screen.dart';
import 'package:football/widget/bottom_nav_item.dart';

class PlayerViewScreen extends StatefulWidget {
  const PlayerViewScreen({Key? key}) : super(key: key);

  @override
  State<PlayerViewScreen> createState() => _PlayerViewScreenState();
}

class _PlayerViewScreenState extends State<PlayerViewScreen> {
  int selectedScreenIndex = 0;

  List<ScreenModel> screens = [
    ScreenModel(screen: const PlayerStatsScreen()),
    ScreenModel(screen: const PlayerNewsScreen()),
    ScreenModel(screen: const PlayerContractsScreen()),
    ScreenModel(screen: const MatchesScreen()),
    ScreenModel(screen: const PlayerProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
              title: 'News',
              onPressed: () {
                setState(() => selectedScreenIndex = 1);
              },
              icon: 'news',
              isSelected: selectedScreenIndex == 1,
            ),
            BottomNavItem(
              title: 'Contracts',
              onPressed: () => setState(() => selectedScreenIndex = 2),
              icon: 'file',
              isSelected: selectedScreenIndex == 2,
            ),
            BottomNavItem(
              title: 'Matches',
              onPressed: () {
                setState(() => selectedScreenIndex = 3);
              },
              icon: 'market',
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
