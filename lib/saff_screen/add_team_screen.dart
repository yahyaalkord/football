import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/context_extenssion.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/app_text_field.dart';

import '../api_controller/saff_process_api_controller.dart';
import '../get/saff_process_getx_controller.dart';
import '../helpers/api_response.dart';

class AddTeamScreen extends StatefulWidget {
  const AddTeamScreen({Key? key}) : super(key: key);
  @override
  State<AddTeamScreen> createState() => _AddTeamScreenState();
}

class _AddTeamScreenState extends State<AddTeamScreen> {
  SaffProcessGetxController controller = SaffProcessGetxController.to;
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _mobileController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _mobileController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
              title: 'Team name',
              hint: 'Team name',
              keyboardType: TextInputType.name,
              controller: _nameController),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: AppTextField(
                isColumn: true,
                sizedBox: 9,
                title: 'Team email',
                hint: 'Team email',
                keyboardType: TextInputType.name,
                controller: _emailController),
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
              onPressed: () async{
                await _performUpdate();
              },
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _performUpdate() async {
    if (_checkData()) {
      await _update();
    }
  }

  bool _checkData() {
    if (_mobileController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _emailController.text.isNotEmpty) {
      return true;
    } else {
      context.showSnackBar(
          message: 'Please complete the required data!', error: true);
      return false;
    }
  }

  Future<void> _update() async {
    ApiResponse apiResponse = await SaffProcessApiController().adminCreateTeam(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        mobile: _mobileController.text);
    if(apiResponse.success){
      context.showSnackBar(message: apiResponse.message);
      controller.read();
      Future.delayed(Duration(seconds: 1),(){
        Navigator.pop(context);
      });
    }else{
      context.showSnackBar(message: apiResponse.message,error: !apiResponse.success);
    }
  }
}
