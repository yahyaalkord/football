import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/widget/player_new_item.dart';

class PlayerNewsScreen extends StatefulWidget {
  const PlayerNewsScreen({Key? key}) : super(key: key);

  @override
  State<PlayerNewsScreen> createState() => _PlayerNewsScreenState();
}

class _PlayerNewsScreenState extends State<PlayerNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        itemCount: 2,
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemBuilder: (context, index) {
          return PlayerNewItem(
            onPressed: () =>
                Navigator.pushNamed(context, '/player_new_details_screen'),
            img: 'assets/images/player.png',
            title: 'Romain club',
            dec:
                'Romain Perraud scored twice to seal Southampton’s place in the FA Cup fifth round with a 2-1 win over Mick McCarthy’s Blackpool at St Mary’s.',
          date: '2023-1-27',
          );
        },
      ),
    );
  }
}