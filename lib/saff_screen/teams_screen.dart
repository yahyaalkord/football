import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/get/saff_process_getx_controller.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/saff_screen/team_player_screen.dart';
import 'package:football/saff_screen/update_team_screen.dart';
import 'package:football/widget/custom_floating_button.dart';
import 'package:football/widget/team_item.dart';
import 'package:get/get.dart';

import '../api_controller/auth_api_controller.dart';
import '../helpers/api_response.dart';
import '../helpers/text_style.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  SaffProcessGetxController controller =Get.put<SaffProcessGetxController>(SaffProcessGetxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams'),
        leading: IconButton(
            onPressed: ()async{
          ApiResponse apiResponse = await AuthApiController().logout();
          if (apiResponse.success) {
            Navigator.pushNamedAndRemoveUntil(context, '/login_as_screen', (route) => false);
            Get.delete<SaffProcessGetxController>(force: true);
          }
        }, icon: const Icon(Icons.logout_outlined,color: AppColors.primary,)),
      ),
      body: GetBuilder<SaffProcessGetxController>(
        builder: (SaffProcessGetxController controller) {
        if(controller.loading==true){
          return  const Center(child: CircularProgressIndicator(color: AppColors.primary,),);
        }else if(controller.allTeam.isNotEmpty){
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
            separatorBuilder: (context, index) => SizedBox(height: 38.h),
            itemCount: controller.allTeam.length,
            itemBuilder: (context, index) {
              return TeamItem(
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TeamPlayerScreen(id: controller.allTeam[index].id);
                  },));
                },
                teamName: controller.allTeam[index].name,
                mobile: controller.allTeam[index].mobile,
                playerNo: 11,
                onDeletePress: () async{
                  await controller.deleteTeam(context, id: controller.allTeam[index].id, index: index);
                },
                onEditPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UpdateTeamScreen(team: controller.allTeam[index]);
                  },));
                },
              );
            },
          );
        }else{
          return Center(child: Text(
            'There is no team...',
            textAlign: TextAlign.center,
            style: AppTextStyle.subTitleBlack,
          ),);
        }
      },),
      floatingActionButton: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 5.h),
        child: CustomFloatingButton(
          onPressed: () => Navigator.pushNamed(context, '/add_team_screen'),
        ),
      ),
    );
  }
}