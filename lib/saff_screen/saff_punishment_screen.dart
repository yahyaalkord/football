import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/get/saff_process_getx_controller.dart';
import 'package:football/saff_screen/update_punishments_screen.dart';
import 'package:football/widget/custom_floating_button.dart';
import 'package:football/widget/saff_punishhment_item.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../helpers/app_colors.dart';
import '../helpers/text_style.dart';

class SaffPunishmentScreen extends StatefulWidget {
  const SaffPunishmentScreen({Key? key}) : super(key: key);

  @override
  State<SaffPunishmentScreen> createState() => _SaffPunishmentScreenState();
}

class _SaffPunishmentScreenState extends State<SaffPunishmentScreen> {
  SaffProcessGetxController controller = SaffProcessGetxController.to;
  @override
  void initState() {
    controller.readPunishments();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Punishments'),
      ),
      body: GetBuilder<SaffProcessGetxController>(
        builder: (SaffProcessGetxController controller) {
          if(controller.loading==true){
            return  const Center(child: CircularProgressIndicator(color: AppColors.primary,),);
          }else if(controller.punish.isNotEmpty){
            return  ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemCount: controller.punish.length,
              itemBuilder: (context, index) {
                return SaffPunishmentItem(
                  index: index,
                  desc:controller.punish[index].description,
                  For: controller.punish[index].title,
                  onDeletePress: () async{
                    await controller.deletePunish(context, id: controller.punish[index].id, index: index);
                  },
                  onEditPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return UpdatePunishmentScreen(punishments: controller.punish[index]);
                    },));
                  },
                );
              },
            );
          }else{
            return Center(child: Text(
              'There is no Punishment...',
              textAlign: TextAlign.center,
              style: AppTextStyle.subTitleBlack,
            ),);
          }
        },),
      floatingActionButton: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 5.h),
        child: CustomFloatingButton(
          onPressed: () =>
              Navigator.pushNamed(context, '/add_punishments_screen'),
        ),
      ),
    );
  }
}
