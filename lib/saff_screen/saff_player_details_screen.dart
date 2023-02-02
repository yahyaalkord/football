import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/custom_details.dart';

class SaffPlayerDetailsScreen extends StatefulWidget {
  const SaffPlayerDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SaffPlayerDetailsScreen> createState() =>
      _SaffPlayerDetailsScreenState();
}

class _SaffPlayerDetailsScreenState extends State<SaffPlayerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Details'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: const [
          CustomDetails(
            img: 'assets/images/user.png',
            name: 'Ahmed Ali',
            evaluation: 8.4,
            startDate: '2023-1-23',
            endDate: '2023-1-23',
          ),
        ],
      ),
    );
  }
}
