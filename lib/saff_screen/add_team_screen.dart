import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/app_text_field.dart';

class AddTeamScreen extends StatefulWidget {
  const AddTeamScreen({Key? key}) : super(key: key);

  @override
  State<AddTeamScreen> createState() => _AddTeamScreenState();
}

class _AddTeamScreenState extends State<AddTeamScreen> {
  late TextEditingController _userNameController;
  late TextEditingController _nameController;
  late TextEditingController _mobileController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _nameController = TextEditingController();
    _mobileController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Team'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: [
          AppTextField(
              isColumn: true,
              sizedBox: 9,
              title: 'Team username',
              hint: 'Team username',
              keyboardType: TextInputType.name,
              controller: _userNameController),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: AppTextField(
                isColumn: true,
                sizedBox: 9,
                title: 'Team name',
                hint: 'Team name',
                keyboardType: TextInputType.name,
                controller: _nameController),
          ),
          AppTextField(
              isColumn: true,
              sizedBox: 9,
              title: 'Mobile',
              hint: '+966767438234',
              keyboardType: TextInputType.phone,
              controller: _mobileController),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 20.h,bottom: 33.h),
            child: AppTextField(
                isColumn: true,
                sizedBox: 9,
                title: 'Password',
                hint: '******',
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: AppButton(
              text: 'Add Team',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
