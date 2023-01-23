import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/contract_item.dart';

class TeamMemberContract extends StatefulWidget {
  const TeamMemberContract({Key? key}) : super(key: key);

  @override
  State<TeamMemberContract> createState() => _TeamMemberContractState();
}

class _TeamMemberContractState extends State<TeamMemberContract> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.only(top: 25.h,bottom: 15.h),
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemCount: 5,
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
    );
  }
}
