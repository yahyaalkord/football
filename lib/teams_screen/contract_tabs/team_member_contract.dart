import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/team_member_item.dart';

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
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemCount: 5,
      itemBuilder: (context, index) {
        return TeamMemberItem(
          img: 'assets/images/user.png',
          name: 'Ahmed Ali',
          startDate: '2023-1-23',
          endDate: '2025-6-23',
          evaluation: 8.4,
          onPressed: () {
            Navigator.pushNamed(context, '/player_details_screen');
          },
        );
      },
    );
  }
}
