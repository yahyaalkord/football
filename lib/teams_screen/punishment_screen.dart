import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/api_controller/team_process_api_controller.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/punishments.dart';
import 'package:football/widget/punishment_item.dart';

class PunishmentScreen extends StatefulWidget {
  const PunishmentScreen({Key? key}) : super(key: key);

  @override
  State<PunishmentScreen> createState() => _PunishmentScreenState();
}

class _PunishmentScreenState extends State<PunishmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PUNISHMENTS'),
      ),
      body: FutureBuilder<List<Punishments>>(
        future: TeamProcessApiController().getTeamPunishment(),
        builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(color: AppColors.primary,),);
        }else if(snapshot.hasData&&snapshot.data!.isNotEmpty){
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return PunishmentItem(
                index: index,
                desc: snapshot.data![index].description,
              );
            },
          );
        }else{
          return SizedBox();
        }
      },)
    );
  }
}