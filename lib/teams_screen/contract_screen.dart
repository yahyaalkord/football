import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/teams_screen/contract_tabs/management_contract.dart';
import 'package:football/teams_screen/contract_tabs/medical_team_contract.dart';
import 'package:football/teams_screen/contract_tabs/team_member_contract.dart';
import 'package:google_fonts/google_fonts.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({Key? key}) : super(key: key);

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  List<String> tabs = <String>[
    'Team members',
    'Medical team',
    'Management',
  ];
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CONTRACTS'),
        actions: [
          IconButton(
            padding: EdgeInsetsDirectional.only(end: 17.w),
            constraints: const BoxConstraints(),
            onPressed: () {
              Navigator.pushNamed(context, '/add_user_screen');
            },
            icon: const Icon(
              Icons.add_outlined,
              color: AppColors.primary,
              size: 27,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 30.h,
              maxWidth: double.infinity,
            ),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 25.w,
                );
              },
              itemCount: tabs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      tabIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 50),
                    width: 95.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: tabIndex == index
                          ? AppColors.primary
                          : AppColors.white,
                    ),
                    child: Center(
                      child: Text(
                        tabs[index],
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: tabIndex == index
                              ? AppColors.white
                              : AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          IndexedStack(
            index: tabIndex,
            children: [
              Visibility(
                visible: tabIndex == 0,
                child: const TeamMemberContract(),
              ),
              Visibility(
                visible: tabIndex == 1,
                child: const MedicalTeamContract(),
              ),
              Visibility(
                visible: tabIndex == 2,
                child: const ManagementContract(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
