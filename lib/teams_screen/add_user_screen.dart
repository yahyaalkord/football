import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/context_extenssion.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/widget/app_button.dart';
import 'package:google_fonts/google_fonts.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  bool isStretched = false;
  List<String> user = <String>[
    'Team members',
    'Medical team',
    'Management',
  ];
  int? tabIndex;
  String title = 'Team member - Medical team - Management';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: [
          Text('What Kind of user you want to add?',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
          SizedBox(height: 17.h),
          InkWell(
            onTap: () {
              setState(() {
                isStretched = !isStretched;
              });
            },
            child: Container(
              padding: EdgeInsetsDirectional.only(start: 13.w, end: 18.w),
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: isStretched
                    ? BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r))
                    : BorderRadius.circular(20.r),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.30)),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.boldBlack,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isStretched,
            child: Column(
              children: [
                Container(
                  color: AppColors.white,
                  child: Divider(
                      height: 10,
                      thickness: 1,
                      endIndent: 15.w,
                      indent: 15.w,
                      color: Colors.black.withOpacity(0.30)),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: index == user.length-1 ? BorderRadius.only(
                          bottomLeft: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r),
                        ) : BorderRadius.circular(0),
                      ),
                      onTap: () {
                        setState(() {
                          tabIndex = index;
                          title = user[index];
                          isStretched = !isStretched;
                        });
                      },
                      tileColor: AppColors.white,
                      dense: true,
                      title: Text(
                        user[index],
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.sameGrey),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsetsDirectional.only(top: 80.h, start: 14.w, end: 14.w),
            child: AppButton(
              text: 'Start',
              onPressed: () {
                  if (tabIndex == 0) {
                    Navigator.pushNamed(context, '/add_player_screen');
                  } else if (tabIndex == 1) {
                    Navigator.pushNamed(context, '/add_medical_screen');
                  } else {
                    Navigator.pushNamed(context, '/add_management_screen');
                  }
              },
            ),
          ),
        ],
      ),
    );
  }
}
