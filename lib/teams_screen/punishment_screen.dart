import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemCount: 4,
        itemBuilder: (context, index) {
          return PunishmentItem(
            index: index,
            desc: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummytext ever since the 1500s',
          );
        },
      ),
    );
  }
}