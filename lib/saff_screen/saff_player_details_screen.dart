import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/app_button.dart';
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
        children: [
          const CustomDetails(
            img: 'assets/images/user.png',
            name: 'Ahmed Ali',
            evaluation: 8.4,
            about:
                'Lorem Ipsum is simply dummy text of the printing and type setting industry Lorem Ipsum has been the industry\'s',
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: 100.h, bottom: 14.h, start: 14.w, end: 14.w),
            child: AppButton(
              text: 'Accept',
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: AppButton(
              backgroundColor: const Color(0xFFBC2F2F),
              text: 'Reject',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
