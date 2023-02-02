import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/app_text_field.dart';

class AddManagementScreen extends StatefulWidget {
  const AddManagementScreen({Key? key}) : super(key: key);

  @override
  State<AddManagementScreen> createState() => _AddManagementScreenState();
}

class _AddManagementScreenState extends State<AddManagementScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _mobileController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _mobileController = TextEditingController();
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
      appBar: AppBar(
        title: const Text('Add Management user'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: [
          AppTextField(
              isColumn: true,
              title: 'Name',
              hint: 'name',
              keyboardType: TextInputType.name,
              controller: _nameController),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 17.h),
            child: AppTextField(
                isColumn: true,
                title: 'Email',
                hint: 'email',
                keyboardType: TextInputType.emailAddress,
                controller: _emailController),
          ),
          AppTextField(
              isColumn: true,
              title: 'Mobile',
              hint: 'mobile',
              keyboardType: TextInputType.emailAddress,
              controller: _emailController),
          SizedBox(height: 17.h),
          AppTextField(
              isColumn: true,
              title: 'Password',
              hint: '*******',
              keyboardType: TextInputType.visiblePassword,
              controller: _passwordController),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: 79.h, bottom: 30.h, start: 14.w, end: 14.w),
            child: AppButton(
              text: 'Add Management User',
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
