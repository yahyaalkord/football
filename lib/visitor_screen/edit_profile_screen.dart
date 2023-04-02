import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/get/visitor_getx_controller.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/context_extenssion.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/shared_pref_controller/shared_pref_controller.dart';
import 'package:football/widget/app_button.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  VisitorGetxController controller = VisitorGetxController.to;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _mobileController;
  late ImagePicker _imagePicker;
  XFile? _pickedImage;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _nameController = TextEditingController(text: controller.name);
    _emailController = TextEditingController(text: controller.email);
    _passwordController = TextEditingController();
    _mobileController = TextEditingController(text: controller.mobile);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(' Edit Profile'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primary,
            size: 22,
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsetsDirectional.only(end: 16.w),
            constraints: const BoxConstraints(),
            onPressed: () async {
              if (_passwordController.text.isNotEmpty) {
                await controller.visitorEditProfile(context,
                    name: _nameController.text,
                    email: _emailController.text,
                    mobile: _mobileController.text,
                    password: _passwordController.text);
              } else {
                context.showSnackBar(
                    message: 'Please enter your password', error: true);
              }
            },
            icon: SvgPicture.asset(
              "assets/svg_images/contract.svg",
              width: 20,
              height: 20,
              color: AppColors.primary,
            ),
          ),
        ],
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
            child: _pickedImage == null
                ? controller.image == ''
                    ? const Image(
                        image: AssetImage('assets/images/profile2.png'))
                    : Image.network(
                        controller.imageUrl,
                        fit: BoxFit.cover,
                      )
                : Image.file(
                    File(_pickedImage!.path),
                    fit: BoxFit.contain,
                  ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 11.h, bottom: 10.h),
            child: Center(
              child: _pickedImage == null
                  ? AppButton(
                      text: 'Change Profile Picture',
                      onPressed: () {
                        _pickImage();
                      },
                      fontSize: 12.sp,
                      width: 180.w,
                      height: 28,
                      radius: 8,
                    )
                  : AppButton(
                      text: 'Save',
                      onPressed: () async {
                        await controller.visitorChangeImage(context,
                            image: File(_pickedImage!.path));
                      },
                      fontSize: 12.sp,
                      width: 180.w,
                      height: 28,
                      radius: 8,
                    ),
            ),
          ),
          Text(
            'Name:',
            style: AppTextStyle.headTitle,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 9.h, bottom: 9.h),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  hintText: SharedPrefController()
                      .getValueFor(key: PrefKeys.name.name)),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Email:',
            style: AppTextStyle.headTitle,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 9.h, bottom: 9.h),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: SharedPrefController()
                      .getValueFor(key: PrefKeys.email.name)),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Mobile:',
            style: AppTextStyle.headTitle,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 9.h, bottom: 9.h),
            child: TextField(
              controller: _mobileController,
              decoration: InputDecoration(
                  hintText: SharedPrefController()
                      .getValueFor(key: PrefKeys.mobile.name)),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Password:',
            style: AppTextStyle.headTitle,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 9.h, bottom: 9.h),
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(hintText: '*******'),
            ),
          ),
        ],
      ),
    );
  }

  void _pickImage() async {
    XFile? imageFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() => _pickedImage = imageFile);
    }
  }
}
