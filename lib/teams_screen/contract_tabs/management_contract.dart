import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/teams_screen/player_details_screen.dart';
import 'package:football/widget/management_item.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../get/team_process_getx_controller.dart';
import '../../helpers/app_colors.dart';

class ManagementContract extends StatefulWidget {
  const ManagementContract({Key? key}) : super(key: key);

  @override
  State<ManagementContract> createState() => _ManagementContractState();
}

class _ManagementContractState extends State<ManagementContract> {
  @override
  Widget build(BuildContext context) {
    TeamProcessGetxController controller =TeamProcessGetxController.to;

    return GetBuilder<TeamProcessGetxController>(
      builder: (TeamProcessGetxController controller) {
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
              return ManagementItem(
                isData: controller.teams[index].image!=null?true:false,
                img: controller.teams[index].imageUrl??'',
                name: controller.teams[index].name,
                email: controller.teams[index].email,
                onPressed: () {
              /*    Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PlayerDetailsScreen(players: controller.teams[index]);
                  },));*/
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
