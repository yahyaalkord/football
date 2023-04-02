import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/team_players_model.dart';
import 'package:football/teams_screen/player_evaluation_screen.dart';
import 'package:football/widget/custom_details.dart';

class PlayerDetailsScreen extends StatefulWidget {
  const PlayerDetailsScreen({required this.players,Key? key}) : super(key: key);
  final TeamPlayers players;

  @override
  State<PlayerDetailsScreen> createState() => _PlayerDetailsScreenState();
}

class _PlayerDetailsScreenState extends State<PlayerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Details'),
        actions: [
          IconButton(
            padding: EdgeInsetsDirectional.only(end: 16.w),
            constraints: const BoxConstraints(),
            onPressed: () =>
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return PlayerEvaluationScreen(id: widget.players.id,);
                },)),
            icon: SvgPicture.asset(
              "assets/svg_images/contract.svg",
              width: 20,
              height: 20,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children:  [
          CustomDetails(
            isData: widget.players.image!=null?true:false,
            img: widget.players.imageUrl??'',
            name: widget.players.name,
            evaluation: double.parse(widget.players.rate.toString()),
            startDate: widget.players.startDate??'',
            endDate: widget.players.endDate??'',
            topPad: 30,
            bottomPad: 35,
            topHeight: 14,
            bottomHeight: 20,
          ),
        ],
      ),
    );
  }
}
