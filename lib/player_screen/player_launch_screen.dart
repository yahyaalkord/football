import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayerLaunchScreen extends StatefulWidget {
  const PlayerLaunchScreen({Key? key}) : super(key: key);

  @override
  State<PlayerLaunchScreen> createState() => _PlayerLaunchScreenState();
}

class _PlayerLaunchScreenState extends State<PlayerLaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/player_signin_screen');
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
