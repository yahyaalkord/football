import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisitorLaunchScreen extends StatefulWidget {
  const VisitorLaunchScreen({Key? key}) : super(key: key);

  @override
  State<VisitorLaunchScreen> createState() => _VisitorLaunchScreenState();
}

class _VisitorLaunchScreenState extends State<VisitorLaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/visitor_signin_screen');
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
