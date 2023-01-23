import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
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
    'Team member contract',
    'Medical team contract',
  ];
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CONTRACTS'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 40.h,
              maxWidth: double.infinity.w,
            ),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 15.w,
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
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: tabIndex == index
                          ? AppColors.primary
                          : AppColors.white,
                    ),
                    child: Center(
                      child: Text(
                        tabs[index],
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
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
            ],
          ),
        ],
      ),
    );
  }
}
