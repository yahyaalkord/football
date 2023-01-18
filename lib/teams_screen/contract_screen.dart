import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/contract_item.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({Key? key}) : super(key: key);

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CONTRACTS'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 25.h),
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemCount: 4,
        itemBuilder: (context, index) {
          return ContractItem(
            img: 'assets/images/user.png',
            name: 'Ahmed Ali',
            contYear: 'contract with 2 years',
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
