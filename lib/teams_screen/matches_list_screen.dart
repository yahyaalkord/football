import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/get/team_process_getx_controller.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/widget/custom_button.dart';
import 'package:football/widget/match_item.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'matches_details_screen.dart';

class MatchesListScreen extends StatefulWidget {
  const MatchesListScreen({Key? key}) : super(key: key);

  @override
  State<MatchesListScreen> createState() => _MatchesListScreenState();
}

class _MatchesListScreenState extends State<MatchesListScreen> {
  TeamProcessGetxController controller =TeamProcessGetxController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches list'),
      ),
      body: GetBuilder<TeamProcessGetxController>(
        builder: (controller) {
          if(controller.loading==true){
            return Center(child: CircularProgressIndicator(color: AppColors.primary,),);
          }else if(controller.teamMatch.isNotEmpty){
            return ListView.separated(
              itemCount: controller.teamMatch.length,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return MatchItem(
                  onPress: () =>
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return MatchesDetailsScreen(match: controller.teamMatch[index]);
                      },)),
                  name: controller.teamMatch[index].teamA,
                  date: controller.teamMatch[index].date,
                  startTime: controller.teamMatch[index].time,
                  endTime: '',
                );
              },
            );
          }else{
            return SizedBox();
          }
        },),
    );
  }
}