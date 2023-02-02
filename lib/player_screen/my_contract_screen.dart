import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/widget/custom_contract.dart';

class MyContractScreen extends StatefulWidget {
  const MyContractScreen({Key? key}) : super(key: key);

  @override
  State<MyContractScreen> createState() => _MyContractScreenState();
}

class _MyContractScreenState extends State<MyContractScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('My Contract'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemCount: 2,
        itemBuilder: (context, index) {
          return const CustomContract(
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
