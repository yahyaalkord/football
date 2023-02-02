import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/widget/player_contract_item.dart';

class PlayerContractsScreen extends StatefulWidget {
  const PlayerContractsScreen({Key? key}) : super(key: key);

  @override
  State<PlayerContractsScreen> createState() => _PlayerContractsScreenState();
}

class _PlayerContractsScreenState extends State<PlayerContractsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Contracts'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(height: 30.h),
        itemBuilder: (context, index) {
          return PlayerContractItem(
            onPressed: () =>
                Navigator.pushNamed(context, '/contract_details_screen'),
            img: 'assets/images/club.png',
            name: 'Club name',
            startDate: '2023-1-23',
            endDate: '2025-6-23',
          );
        },
      ),
    );
  }
}
