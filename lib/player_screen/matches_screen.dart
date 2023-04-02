import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/team_match.dart';
import 'package:football/widget/player_match_item.dart';

import '../api_controller/player_process_api_controller.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Matches'),
      ),
      body: FutureBuilder<List<TeamMatch>>(
        future: PlayerProcessApiController().playerMatches(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: AppColors.primary),);
          }else if(snapshot.hasData&&snapshot.data!.isNotEmpty){
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemBuilder: (context, index) {
                return  PlayerMatchItem(
                  img: 'assets/images/club.png',
                  name: 'Club name',
                  date: snapshot.data![index].date,
                  time: snapshot.data![index].time,
                  stadiumName: snapshot.data![index].staduim,
                  refereeName: snapshot.data![index].referee,
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
