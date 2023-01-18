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
  late TextEditingController _nameController;
  late TextEditingController _mobileController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _mobileController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
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
              horizontalPad: 13,
              isColumn: true,
              sizedBox: 9,
              title: 'Team name',
              hint: 'team name',
              keyboardType: TextInputType.name,
              controller: _nameController),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 21.h),
            child: AppTextField(
                horizontalPad: 13,
                isColumn: true,
                sizedBox: 9,
                title: 'Mobile',
                hint: '+966767438234',
                keyboardType: TextInputType.name,
                controller: _nameController),
          ),
          AppTextField(
              horizontalPad: 13,
              isColumn: true,
              sizedBox: 9,
              title: 'Password',
              hint: '******',
              keyboardType: TextInputType.name,
              controller: _nameController),
          SizedBox(height: 33.h),
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
