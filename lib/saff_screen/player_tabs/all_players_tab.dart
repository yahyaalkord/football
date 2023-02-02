import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/player_item.dart';

class AllPlayersScreen extends StatefulWidget {
  const AllPlayersScreen({Key? key}) : super(key: key);

  @override
  State<AllPlayersScreen> createState() => _AllPlayersScreenState();
}

class _AllPlayersScreenState extends State<AllPlayersScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsetsDirectional.only(bottom: 85.h),
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemCount: 5,
      itemBuilder: (context, index) {
        return PlayerItem(
          img: 'assets/images/user2.png',
          name: 'Ahmed Ali',
          contYearColor: const Color(0xFFBC2F2F),
          about:
              'Lorem Ipsum is simply dummy text of the printing and type setting industry Lorem Ipsum has beenthe industry\'s',
          evaluation: 8.4,
          onPressed: () {
            Navigator.pushNamed(context, '/saff_player_details_screen');
          },
        );
      },
    );
  }
}
