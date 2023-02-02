import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaffLaunchScreen extends StatefulWidget {
  const SaffLaunchScreen({Key? key}) : super(key: key);

  @override
  State<SaffLaunchScreen> createState() => _SaffLaunchScreenState();
}

class _SaffLaunchScreenState extends State<SaffLaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/saff_signin_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 373.h,
          width: 372.w,
        ),
      ),
    );
  }
}
