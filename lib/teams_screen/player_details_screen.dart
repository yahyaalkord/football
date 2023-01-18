import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/app_button.dart';
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
                top: 50.h, bottom: 10.h, start: 14.w, end: 14.w),
            child: AppButton(
              text: 'Request SAFF to Add Player',
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: AppButton(
              text: 'Add Contract',
              onPressed: () {
                Navigator.pushNamed(context, '/add_contract_screen');
              },
            ),
          ),
        ],
      ),
    );
  }
}
