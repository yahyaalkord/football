import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/context_extenssion.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/app_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class VisitorSignUpScreen extends StatefulWidget {
  const VisitorSignUpScreen({Key? key}) : super(key: key);

  @override
  State<VisitorSignUpScreen> createState() => _VisitorSignUpScreenState();
}

class _VisitorSignUpScreenState extends State<VisitorSignUpScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _mobileController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _mobileController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: ListView(
          children: [
            Image.asset('assets/images/logo.png', width: 238.w, height: 238.h),
            Text(
              'Let’s Get Started',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 9.h, bottom: 20.h),
              child: Text(
                'Create an account to get all features',
                textAlign: TextAlign.center,
                style: AppTextStyle.subTitleBlack,
              ),
            ),
            AppTextField(
                label: 'Name',
                borderColor: AppColors.lightPrimary,
                keyboardType: TextInputType.text,
                controller: _nameController),
            SizedBox(
              height: 11.h,
            ),
            AppTextField(
                label: 'Email',
                borderColor: AppColors.lightPrimary,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 11.h),
              child: AppTextField(
                  label: 'Mobile',
                  borderColor: AppColors.lightPrimary,
                  keyboardType: TextInputType.phone,
                  controller: _mobileController),
            ),
            AppTextField(
                label: 'Password',
                borderColor: AppColors.lightPrimary,
                keyboardType: TextInputType.text,
                controller: _passwordController),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 20.h,
                bottom: 14.h,
              ),
              child: AppButton(
                text: 'Sign Up',
                onPressed: () async => await _performSignUp(),
              ),
            ),
            RichText(
              softWrap: true,
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Have an account?',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.boldBlack,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Log in',
                    style: AppTextStyle.titlePrimary,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pushReplacementNamed(
                          context, '/visitor_signin_screen'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }

  Future<void> _performSignUp() async {
    if (_checkData()) {
      await _signUp();
    }
  }

  bool _checkData() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _mobileController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter Required Data', error: true);
    return false;
  }

  Future<void> _signUp() async {
    Navigator.pushReplacementNamed(context, '/visitor_view_screen');
  }
}
