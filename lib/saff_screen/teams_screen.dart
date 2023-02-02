import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/custom_floating_button.dart';
import 'package:football/widget/team_item.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        separatorBuilder: (context, index) => SizedBox(height: 38.h),
        itemCount: 3,
        itemBuilder: (context, index) {
          return TeamItem(
            onPress: () {
              Navigator.pushNamed(context, '/team_player_screen');
            },
            teamName: 'KSA team',
            mobile: '+96656473802',
            playerNo: 11,
            onDeletePress: () {},
            onEditPress: () {},
          );
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 5.h),
        child: CustomFloatingButton(
          onPressed: () => Navigator.pushNamed(context, '/add_team_screen'),
        ),
      ),
    );
  }
}