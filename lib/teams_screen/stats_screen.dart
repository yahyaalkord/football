import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/api_controller/team_process_api_controller.dart';
import 'package:football/get/team_process_getx_controller.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/team_match.dart';
import 'package:football/shared_pref_controller/shared_pref_controller.dart';
import 'package:football/teams_screen/matches_details_screen.dart';
import 'package:football/widget/custom_floating_button.dart';
import 'package:football/widget/stats_item.dart';
import 'package:get/get.dart';

import '../widget/match_item.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  TeamProcessGetxController controller =
      Get.put<TeamProcessGetxController>(TeamProcessGetxController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STATS'),
      ),
      body: GetBuilder<TeamProcessGetxController>(
        builder: (controller) {
          if(controller.loading==true){
            return Center(child: CircularProgressIndicator(color: AppColors.primary,),);
          }else if(controller.home!=null){
            return  ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
              children: [
                StatsItem(
                  title: 'Matches',
                  count: controller.home!.matches,
                  onPress: () => Navigator.pushNamed(context, '/matches_list_screen'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 38.h),
                  child:  StatsItem(title: 'Awards', count: 47,onPress: () => Navigator.pushNamed(context, '/matches_list_screen'),),
                ),
                StatsItem(
                  title: 'Violations',
                  count: controller.home!.punishments,onPress: () => Navigator.pushNamed(context, '/matches_list_screen'),),
              ],
            );
          }else{
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
              children: [
                StatsItem(
                  title: 'Matches',
                  count: 0,
                  onPress: () => Navigator.pushNamed(context, '/matches_list_screen'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 38.h),
                  child: const StatsItem(title: 'Awards', count: 47),
                ),
                StatsItem(
                  title: 'Violations',
                  count: 0,onPress: () => Navigator.pushNamed(context, '/matches_list_screen'),),
              ],
            );
          }
        },),
      floatingActionButton: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 20.h),
        child: CustomFloatingButton(
          onPressed: () => Navigator.pushNamed(context, '/add_match_screen'),
        ),
      ),
    );
  }
}
