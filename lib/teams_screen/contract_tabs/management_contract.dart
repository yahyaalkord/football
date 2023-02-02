import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/management_item.dart';

class ManagementContract extends StatefulWidget {
  const ManagementContract({Key? key}) : super(key: key);

  @override
  State<ManagementContract> createState() => _ManagementContractState();
}

class _ManagementContractState extends State<ManagementContract> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.only(top: 25.h,bottom: 15.h),
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemCount: 5,
      itemBuilder: (context, index) {
        return ManagementItem(
          img: 'assets/images/user3.png',
          name: 'Ahmed Ali',
          email: 'ahmedali@gmail.com',
          onPressed: () {
            Navigator.pushNamed(context, '/player_details_screen');
          },
        );
      },
    );
  }
}
