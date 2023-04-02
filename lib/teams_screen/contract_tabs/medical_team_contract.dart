import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/get/team_process_getx_controller.dart';
import 'package:football/widget/medical_team_item.dart';
import 'package:football/widget/team_member_item.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../helpers/app_colors.dart';
import '../player_details_screen.dart';

class MedicalTeamContract extends StatefulWidget {
  const MedicalTeamContract({Key? key}) : super(key: key);

  @override
  State<MedicalTeamContract> createState() => _MedicalTeamContractState();
}

class _MedicalTeamContractState extends State<MedicalTeamContract> {
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
              return MedicalTeamItem(
                isData: controller.teams[index].image!=null?true:false,
                img: controller.teams[index].imageUrl??'',
                name: controller.teams[index].name,
                email: controller.teams[index].email,
                specialization: controller.teams[index].specialization??'',
                onPressed: () {
                 /* Navigator.push(context, MaterialPageRoute(builder: (context) {
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
