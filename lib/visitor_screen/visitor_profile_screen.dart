import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/get/visitor_getx_controller.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/context_extenssion.dart';
import 'package:football/helpers/text_style.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../api_controller/auth_api_controller.dart';
import '../helpers/api_response.dart';
import '../shared_pref_controller/shared_pref_controller.dart';

class VisitorProfileScreen extends StatefulWidget {
  const VisitorProfileScreen({Key? key}) : super(key: key);

  @override
  State<VisitorProfileScreen> createState() => _VisitorProfileScreenState();
}

class _VisitorProfileScreenState extends State<VisitorProfileScreen> {
  VisitorGetxController controller = VisitorGetxController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: GetBuilder<VisitorGetxController>(
          builder: (VisitorGetxController controller) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                Container(
                    width: 130.w,
                    height: 130.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: controller.image == ''
                        ? const Image(
                            image: AssetImage('assets/images/profile2.png'))
                        : Image.network(
                            controller.imageUrl,
                            fit: BoxFit.cover,
                          )),
                SizedBox(height: 54.h),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () =>
                      Navigator.pushNamed(context, '/edit_profile_screen'),
                  dense: true,
                  title: Text(
                    'Edit profile information',
                    style: AppTextStyle.titlePrimary,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
                Divider(
                  color: AppColors.grey,
                  thickness: 1.5,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () => Navigator.pushNamed(context, '/privacy_screen'),
                  dense: true,
                  title: Text(
                    'Privacy',
                    style: AppTextStyle.titlePrimary,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
                Divider(
                  color: AppColors.grey,
                  thickness: 1.5,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () async {
                    ApiResponse apiResponse =
                        await AuthApiController().logout();
                    if (apiResponse.success) {
                      Get.delete<VisitorGetxController>(force: true);
                      context.showSnackBar(message: apiResponse.message);
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login_as_screen', (route) => false);
                    } else {
                      context.showSnackBar(
                          message: apiResponse.message,
                          error: !apiResponse.success);
                    }
                  },
                  dense: true,
                  title: Text(
                    'Log Out',
                    style: AppTextStyle.titlePrimary,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
              ],
            );
          },
        ));
  }
}
