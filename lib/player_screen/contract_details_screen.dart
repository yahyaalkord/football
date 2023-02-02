import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/custom_contract.dart';

class ContractDetailsScreen extends StatefulWidget {
  const ContractDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ContractDetailsScreen> createState() => _ContractDetailsScreenState();
}

class _ContractDetailsScreenState extends State<ContractDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(title: const Text('Contracts details')),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
            start: 16.w, end: 16.w, top: 50.h, bottom: 25.h),
        children: [
          const CustomContract(
            img: 'assets/images/club.png',
            name: 'Club name',
            startDate: '2023-1-23',
            endDate: '2025-6-23',
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: 81.h, bottom: 16.h, start: 14.w, end: 14.w),
            child: AppButton(
              text: 'Download Contract File',
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: AppButton(
              text: 'Accept Contract',
              onPressed: () {},
            ),
          ),
          Padding(
            padding:
                EdgeInsetsDirectional.only(top: 16.h, start: 14.w, end: 14.w),
            child: AppButton(
              text: 'Reject Contract',
              onPressed: () {},
              backgroundColor: const Color(0xFFBC2F2F),
            ),
          ),
        ],
      ),
    );
  }
}
