import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/widget/custom_details.dart';

class PlayerDetailsScreen extends StatefulWidget {
  const PlayerDetailsScreen({Key? key}) : super(key: key);

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
                Navigator.pushNamed(context, '/player_evaluation_screen'),
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
        children: const [
          CustomDetails(
            img: 'assets/images/user3.png',
            name: 'Ahmed Ali',
            evaluation: 8.4,
            startDate: '2023-1-23',
            endDate: '2023-1-23',
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
