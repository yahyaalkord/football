import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/context_extenssion.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/app_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SaffSignInScreen extends StatefulWidget {
  const SaffSignInScreen({Key? key}) : super(key: key);

  @override
  State<SaffSignInScreen> createState() => _SaffSignInScreenState();
}

class _SaffSignInScreenState extends State<SaffSignInScreen> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
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
              'Welcome Back',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 9.h, bottom: 20.h),
              child: Text(
                'Login to your account',
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
                text: 'Sign In',
                onPressed: () async => await _performSignIn(),
              ),
            ),
            RichText(
              softWrap: true,
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Don\'t have an account?',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.boldBlack,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Create an account',
                    style: AppTextStyle.titlePrimary,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pushReplacementNamed(
                          context, '/saff_signup_screen'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performSignIn() async {
    if (_checkData()) {
      await _signIn();
    }
  }

  bool _checkData() {
    if (_nameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter Required Data', error: true);
    return false;
  }

  Future<void> _signIn() async {
    Navigator.pushReplacementNamed(context, '/saff_view_screen');
  }
}
