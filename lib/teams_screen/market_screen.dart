import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/market_item.dart';
import 'package:football/widget/team_member_item.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MARKET'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemCount: 2,
        itemBuilder: (context, index) {
          return MarketItem(
            img: 'assets/images/user3.png',
            name: 'Ahmed Ali',
            evaluation: 8.4,
            decContract: 'contract is expired',
            color: const Color(0xFFBC2F2F),
            onPressed: () {
              Navigator.pushNamed(context, '/player_details_screen');
            },
          );
        },
      ),
    );
  }
}
