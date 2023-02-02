import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/sponsor_item.dart';

class SponsorsScreen extends StatefulWidget {
  const SponsorsScreen({Key? key}) : super(key: key);

  @override
  State<SponsorsScreen> createState() => _SponsorsScreenState();
}

class _SponsorsScreenState extends State<SponsorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sponsors')),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 153.w / 166.h,
          mainAxisSpacing: 54.h,
          crossAxisSpacing: 37.w,
        ),
        itemBuilder: (context, index) {
          return const SponsorItem(
            img: 'assets/images/sponsor.png',
            name: 'Sponsor',
          );
        },
      ),
    );
  }
}