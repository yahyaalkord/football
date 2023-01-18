import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/contract_item.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 25.h),
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemCount: 4,
        itemBuilder: (context, index) {
          return ContractItem(
            img: 'assets/images/user2.png',
            name: 'Ahmed Ali',
            contYear: 'contract is expired',
            contYearColor: const Color(0xFFBC2F2F),
            about:
                'Lorem Ipsum is simply dummy text of the printing and type setting industry Lorem Ipsum has beenthe industry\'s',
            evaluation: 8.4,
            onPressed: () {
              Navigator.pushNamed(context, '/player_details_screen');
            },
          );
        },
      ),
    );
  }
}
