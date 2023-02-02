import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/new_player_item.dart';

class NewPlayersScreen extends StatefulWidget {
  const NewPlayersScreen({Key? key}) : super(key: key);

  @override
  State<NewPlayersScreen> createState() => _NewPlayersScreenState();
}

class _NewPlayersScreenState extends State<NewPlayersScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsetsDirectional.only(bottom: 85.h),
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemCount: 5,
      itemBuilder: (context, index) {
        return NewPlayerItem(
          img: 'assets/images/user2.png',
          name: 'Ahmed Ali',
          contYearColor: const Color(0xFFBC2F2F),
          about:
          'Lorem Ipsum is simply dummy text of the printing and type setting industry Lorem Ipsum has beenthe industry\'s',
          evaluation: 8.4,
          onAcceptPressed: () {},
          onRejectPressed: () {},
        );
      },
    );
  }
}
