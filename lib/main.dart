import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/saff_screen/add_punishments_screen.dart';
import 'package:football/saff_screen/add_team_screen.dart';
import 'package:football/saff_screen/saff_player_details_screen.dart';
import 'package:football/saff_screen/saff_punishment_screen.dart';
import 'package:football/saff_screen/saff_view_screen.dart';
import 'package:football/saff_screen/team_player_screen.dart';
import 'package:football/saff_screen/teams_screen.dart';
import 'package:football/teams_screen/add_contract_screen.dart';
import 'package:football/teams_screen/add_match_screen.dart';
import 'package:football/teams_screen/auth/signin_screen.dart';
import 'package:football/teams_screen/auth/signup_screen.dart';
import 'package:football/teams_screen/view_screen.dart';
import 'package:football/teams_screen/contract_screen.dart';
import 'package:football/teams_screen/core/launch_screen.dart';
import 'package:football/teams_screen/market_screen.dart';
import 'package:football/teams_screen/player_details_screen.dart';
import 'package:football/teams_screen/profile_screen.dart';
import 'package:football/teams_screen/punishment_screen.dart';
import 'package:football/teams_screen/stats_screen.dart';
import 'helpers/app_colors.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.screenColor,
            appBarTheme: AppBarTheme(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(
                color: Color(0xFF200E32),
              ),
              titleTextStyle: AppTextStyle.titleBlack,
            ),
          ),
          // ********* Teams Screens
          initialRoute: '/launch_screen',
          //********** SAFF Screens
          // initialRoute: '/saff_view_screen',
          routes: {
            '/launch_screen': (context) => const LaunchScreen(),
            '/signup_screen': (context) => const SignUpScreen(),
            '/signin_screen': (context) => const SignInScreen(),
            '/view_screen': (context) => const ViewScreen(),
            '/stats_screen': (context) => const StatsScreen(),
            '/contract_screen': (context) => const ContractScreen(),
            '/market_screen': (context) => const MarketScreen(),
            '/punishment_screen': (context) => const PunishmentScreen(),
            '/profile_screen': (context) => const ProfileScreen(),
            '/player_details_screen': (context) => const PlayerDetailsScreen(),
            '/add_contract_screen': (context) => const AddContractScreen(),
            '/add_match_screen': (context) => const AddMatchScreen(),
            // SAFF Screens
            '/saff_view_screen': (context) => const SaffViewScreen(),
            '/teams_screen': (context) => const TeamsScreen(),
            '/add_team_screen': (context) => const AddTeamScreen(),
            '/saff_punishment_screen': (context) =>
                const SaffPunishmentScreen(),
            '/add_punishments_screen': (context) => const AddPunishmentScreen(),
            '/team_player_screen': (context) => const TeamPlayerScreen(),
            '/saff_player_details_screen': (context) =>
                const SaffPlayerDetailsScreen(),
          },
        );
      },
    );
  }
}
