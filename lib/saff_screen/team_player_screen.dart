import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/saff_screen/player_tabs/all_players_tab.dart';
import 'package:football/saff_screen/player_tabs/new_players_tab.dart';

class TeamPlayerScreen extends StatefulWidget {
  const TeamPlayerScreen({Key? key}) : super(key: key);

  @override
  State<TeamPlayerScreen> createState() => _TeamPlayerScreenState();
}

class _TeamPlayerScreenState extends State<TeamPlayerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Players'),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: double.infinity,
                height: 3.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: const Color(0xFFBBBBBB),
                ),
              ),
              TabBar(
                onTap: (int index) {
                  setState(() {
                    _tabController.index = index;
                  });
                },
                indicatorColor: AppColors.primary,
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.primary,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
                indicatorWeight: 3.h,
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: 'New players',
                  ),
                  Tab(
                    text: 'All players',
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 25.h,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: double.infinity,
                maxHeight: 700.h,
              ),
              child: TabBarView(
                controller: _tabController,
                children: const [
                  NewPlayersScreen(),
                  AllPlayersScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
