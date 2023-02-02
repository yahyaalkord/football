import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/screen_model.dart';
import 'package:football/visitor_screen/favorites_screen.dart';
import 'package:football/visitor_screen/visitor_news_screen.dart';
import 'package:football/visitor_screen/visitor_profile_screen.dart';
import 'package:football/widget/bottom_nav_item.dart';

class VisitorViewScreen extends StatefulWidget {
  const VisitorViewScreen({Key? key}) : super(key: key);

  @override
  State<VisitorViewScreen> createState() => _VisitorViewScreenState();
}

class _VisitorViewScreenState extends State<VisitorViewScreen> {
  int selectedScreenIndex = 0;

  List<ScreenModel> screens = [
    ScreenModel(screen: const VisitorNewsScreen()),
    ScreenModel(screen: const FavoritesScreen()),
    ScreenModel(screen: const VisitorProfileScreen()),
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
              title: 'News',
              onPressed: () {
                setState(() => selectedScreenIndex = 0);
              },
              icon: 'news',
              isSelected: selectedScreenIndex == 0,
            ),
            BottomNavItem(
              title: 'Favorites',
              onPressed: () => setState(() => selectedScreenIndex = 1),
              icon: 'Star',
              isSelected: selectedScreenIndex == 1,
            ),
            BottomNavItem(
              title: 'Profile',
              onPressed: () {
                setState(() => selectedScreenIndex = 2);
              },
              icon: 'profile',
              isSelected: selectedScreenIndex == 2,
            ),
          ],
        ),
      ),
      body: screens[selectedScreenIndex].screen,
    );
  }
}
