import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared_pref_controller/shared_pref_controller.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      bool loggedIn = SharedPrefController().getValueFor<bool>(
          key: PrefKeys.loggedIn.name) ?? false;
      if (loggedIn) {
        if (SharedPrefController().getValueFor(key: PrefKeys.usertype.name) == 'admin') {
          Navigator.pushReplacementNamed(context, '/saff_view_screen');
        } else if(SharedPrefController().getValueFor(key: PrefKeys.usertype.name) == 'team') {
          Navigator.pushReplacementNamed(context, '/view_screen');
        }else if(SharedPrefController().getValueFor(key: PrefKeys.usertype.name) == 'player') {
          Navigator.pushReplacementNamed(context, '/player_view_screen');
        }else{
          Navigator.pushReplacementNamed(context, '/visitor_view_screen');
        }
      }else{
        Navigator.pushReplacementNamed(context, '/login_as_screen');

      }});
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
