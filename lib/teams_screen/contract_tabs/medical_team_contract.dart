import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/medical_team_item.dart';
import 'package:football/widget/team_member_item.dart';

class MedicalTeamContract extends StatefulWidget {
  const MedicalTeamContract({Key? key}) : super(key: key);

  @override
  State<MedicalTeamContract> createState() => _MedicalTeamContractState();
}

class _MedicalTeamContractState extends State<MedicalTeamContract> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.only(top: 25.h,bottom: 15.h),
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemCount: 4,
      itemBuilder: (context, index) {
        return MedicalTeamItem(
          img: 'assets/images/user.png',
          name: 'Ahmed Ali',
          email: 'ahmedali@gmail.com',
          specialization: 'Specialization title',
          onPressed: () {
            Navigator.pushNamed(context, '/player_details_screen');
          },
        );
      },
    );
  }
}
