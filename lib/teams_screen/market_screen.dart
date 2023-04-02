import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/get/team_process_getx_controller.dart';
import 'package:football/teams_screen/player_details_screen.dart';
import 'package:football/widget/market_item.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import '../helpers/app_colors.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  TeamProcessGetxController controller =TeamProcessGetxController.to;
  String formattedDate = DateFormat('MM-dd-yyyy').format(DateTime.now());
  @override
  void initState() {
    controller.readTeam(type: 'players');
    formattedDate.split('-');
    super.initState();
    print(formattedDate);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MARKET'),
      ),
      body: GetBuilder<TeamProcessGetxController>(
        builder: (controller) {
          if(controller.loading==true){
            return Center(child: Column(
              children: [
                SizedBox(height: 100.h,),
                const CircularProgressIndicator(color: AppColors.primary,),
              ],
            ),);
          }else if(controller.teams.isNotEmpty){
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemCount: controller.teams.where((element) => element.numberDate<=6).length,
              itemBuilder: (context, index) {
                return MarketItem(
                  isData: controller.teams[index].image!=null?true:false,
                  img: controller.teams[index].imageUrl??'',
                  name: controller.teams[index].name,
                  evaluation: double.parse(controller.teams[index].rate.toString()),
                  decContract: controller.teams[index].numberDate==0||int.parse(controller.teams[index].endDate!.split('-')[0])<2023?'contract is expired':'in the 6 month ',
                  color:  controller.teams[index].numberDate==0||int.parse(controller.teams[index].endDate!.split('-')[0])<2023?Color(0xFFBC2F2F):Color(0xFFF7FF00),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return PlayerDetailsScreen(players: controller.teams[index]);
                    },));
                  },
                );
              },
            );
          }else {
            return SizedBox();
          }
        },));
  }
}
