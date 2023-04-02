import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';

import '../api_controller/auth_api_controller.dart';
import '../helpers/api_response.dart';

class PlayerProfileScreen extends StatefulWidget {
  const PlayerProfileScreen({Key? key}) : super(key: key);

  @override
  State<PlayerProfileScreen> createState() => _PlayerProfileScreenState();
}

class _PlayerProfileScreenState extends State<PlayerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          Container(
            width: 130.w,
            height: 130.h,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Image(
              image: AssetImage('assets/images/profile2.png'),
            ),
          ),
          SizedBox(height: 105.h),
          ListTile(
            contentPadding: EdgeInsets.zero,
            // onTap: () => Navigator.pushNamed(context, '/my_contract_screen'),
            onTap: () => Navigator.pushNamed(context, '/player_contracts_screen'),
            dense: true,
            title: Text(
              'My Contract',
              style: AppTextStyle.titlePrimary,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(0xFF577D7B),
              size: 20,
            ),
          ),
          Divider(
            color: AppColors.grey,
            thickness: 1.5,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () async{
              ApiResponse apiResponse = await AuthApiController().logout();
              if (apiResponse.success) {
                Navigator.pushNamedAndRemoveUntil(context, '/login_as_screen', (route) => false);
              }
            },
            dense: true,
            title: Text(
              'Log Out',
              style: AppTextStyle.titlePrimary,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(0xFF577D7B),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
