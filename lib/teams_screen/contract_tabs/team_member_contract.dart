import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/get/team_process_getx_controller.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/widget/team_member_item.dart';
import 'package:get/get.dart';

import '../edit_player_screen.dart';
import '../player_details_screen.dart';

class TeamMemberContract extends StatefulWidget {
  const TeamMemberContract({Key? key}) : super(key: key);

  @override
  State<TeamMemberContract> createState() => _TeamMemberContractState();
}

class _TeamMemberContractState extends State<TeamMemberContract> {
  TeamProcessGetxController controller =TeamProcessGetxController.to;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamProcessGetxController>(
      builder: (controller) {
      if(controller.loading==true){
        return Center(child: Column(
          children: [
            SizedBox(height: 100.h,),
            CircularProgressIndicator(color: AppColors.primary,),
          ],
        ),);
      }else if(controller.teams.isNotEmpty){
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsetsDirectional.only(top: 25.h,bottom: 15.h),
          separatorBuilder: (context, index) => SizedBox(height: 20.h),
          itemCount: controller.teams.length,
          itemBuilder: (context, index) {
            return TeamMemberItem(
              isData: controller.teams[index].image!=null?true:false,
              img: controller.teams[index].imageUrl??'',
              name: controller.teams[index].name,
              startDate: controller.teams[index].startDate??'',
              endDate: controller.teams[index].endDate??'',
              evaluation: double.parse(controller.teams[index].rate.toString()),
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditPlayerScreen(players: controller.teams[index]);
                },));
              },
            );
          },
        );
      }else {
        return SizedBox();
      }
    },);
  }
}
