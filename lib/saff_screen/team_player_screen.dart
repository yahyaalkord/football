import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/api_controller/saff_process_api_controller.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/users.dart';
import 'package:football/saff_screen/player_tabs/all_players_tab.dart';
import 'package:football/saff_screen/player_tabs/new_players_tab.dart';
import 'package:football/saff_screen/saff_player_details_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/text_style.dart';
import '../widget/player_item.dart';

class TeamPlayerScreen extends StatefulWidget {
  const TeamPlayerScreen({required this.id,Key? key}) : super(key: key);
  final int id;

  @override
  State<TeamPlayerScreen> createState() => _TeamPlayerScreenState();
}

class _TeamPlayerScreenState extends State<TeamPlayerScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Players'),
      ),
      body: FutureBuilder<List<PlayerModel>>(
        future: SaffProcessApiController().adminPlayers(id: widget.id),
        builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(color: AppColors.primary,),);
        }else if(snapshot.hasData&&snapshot.data!.isNotEmpty){
          return ListView.separated(
            padding: EdgeInsetsDirectional.only(bottom: 85.h),
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return PlayerItem(
                isData: snapshot.data![index].image!=null?true:false,
                img: snapshot.data![index].image??'',
                name: snapshot.data![index].name,
                contYearColor: const Color(0xFFBC2F2F),
                about:snapshot.data![index].specialization??'',
                evaluation: double.parse(snapshot.data![index].rate.toString()),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SaffPlayerDetailsScreen(playet: snapshot.data![index]);
                  },));
                },
              );
            },
          );
        }else{
          return  Center(
            child: Text(
              'This team Player is empty',
              style: AppTextStyle.titlePrimary,
            ),
          );
        }
      },)
    );
  }
}
