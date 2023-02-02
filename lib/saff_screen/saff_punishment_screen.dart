import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/custom_floating_button.dart';
import 'package:football/widget/saff_punishhment_item.dart';

class SaffPunishmentScreen extends StatefulWidget {
  const SaffPunishmentScreen({Key? key}) : super(key: key);

  @override
  State<SaffPunishmentScreen> createState() => _SaffPunishmentScreenState();
}

class _SaffPunishmentScreenState extends State<SaffPunishmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Punishments'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemCount: 4,
        itemBuilder: (context, index) {
          return SaffPunishmentItem(
            index: index,
            desc:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummytext ever since the 1500s',
            For: 'Saudia team',
            onDeletePress: () {},
            onEditPress: () {
              Navigator.pushNamed(context, '/add_punishments_screen');
            },
          );
        },
      ),
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
