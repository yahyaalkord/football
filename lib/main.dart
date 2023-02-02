import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/player_screen/contract_details_screen.dart';
import 'package:football/player_screen/matches_screen.dart';
import 'package:football/player_screen/my_contract_screen.dart';
import 'package:football/player_screen/player_contracts_screen.dart';
import 'package:football/player_screen/player_launch_screen.dart';
import 'package:football/player_screen/player_new_details_screen.dart';
import 'package:football/player_screen/player_news_screen.dart';
import 'package:football/player_screen/player_profile_screen.dart';
import 'package:football/player_screen/player_signin_screen.dart';
import 'package:football/player_screen/player_signup_screen.dart';
import 'package:football/player_screen/player_view_screen.dart';
import 'package:football/saff_screen/add_punishments_screen.dart';
import 'package:football/saff_screen/add_team_screen.dart';
import 'package:football/saff_screen/auth/saff_signin_screen.dart';
import 'package:football/saff_screen/auth/saff_signup_screen.dart';
import 'package:football/saff_screen/core/saff_launch_screen.dart';
import 'package:football/saff_screen/saff_player_details_screen.dart';
import 'package:football/saff_screen/saff_punishment_screen.dart';
import 'package:football/saff_screen/saff_view_screen.dart';
import 'package:football/saff_screen/team_player_screen.dart';
import 'package:football/saff_screen/teams_screen.dart';
import 'package:football/teams_screen/add_contract_screen.dart';
import 'package:football/teams_screen/add_management_screen.dart';
import 'package:football/teams_screen/add_match_screen.dart';
import 'package:football/teams_screen/add_medical_screen.dart';
import 'package:football/teams_screen/add_new_screen.dart';
import 'package:football/teams_screen/add_player_screen.dart';
import 'package:football/teams_screen/add_user_screen.dart';
import 'package:football/teams_screen/auth/team_signin_screen.dart';
import 'package:football/teams_screen/auth/signup_screen.dart';
import 'package:football/teams_screen/matches_details_screen.dart';
import 'package:football/teams_screen/matches_list_screen.dart';
import 'package:football/teams_screen/new_details_screen.dart';
import 'package:football/teams_screen/news_screen.dart';
import 'package:football/teams_screen/player_evaluation_screen.dart';
import 'package:football/teams_screen/sponsor_screen.dart';
import 'package:football/teams_screen/view_screen.dart';
import 'package:football/teams_screen/contract_screen.dart';
import 'package:football/teams_screen/core/launch_screen.dart';
import 'package:football/teams_screen/market_screen.dart';
import 'package:football/teams_screen/player_details_screen.dart';
import 'package:football/teams_screen/profile_screen.dart';
import 'package:football/teams_screen/punishment_screen.dart';
import 'package:football/teams_screen/stats_screen.dart';
import 'package:football/visitor_screen/edit_profile_screen.dart';
import 'package:football/visitor_screen/favorites_screen.dart';
import 'package:football/visitor_screen/visitor_launch_screen.dart';
import 'package:football/visitor_screen/visitor_news_screen.dart';
import 'package:football/visitor_screen/visitor_profile_screen.dart';
import 'package:football/visitor_screen/visitor_signin_screen.dart';
import 'package:football/visitor_screen/visitor_signup_screen.dart';
import 'package:football/visitor_screen/visitor_view_screen.dart';
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
          // initialRoute: '/launch_screen',
          //********** SAFF Screens
          // initialRoute: '/saff_launch_screen',
          //********** Player Screens
          // initialRoute: '/player_launch_screen',
          //********** Visitor Screens
          initialRoute: '/visitor_launch_screen',
          routes: {
            // Teams Screens
            '/launch_screen': (context) => const LaunchScreen(),
            '/signup_screen': (context) => const SignUpScreen(),
            '/team_signin_screen': (context) => const TeamSignInScreen(),
            '/view_screen': (context) => const ViewScreen(),
            '/stats_screen': (context) => const StatsScreen(),
            '/contract_screen': (context) => const ContractScreen(),
            '/market_screen': (context) => const MarketScreen(),
            '/punishment_screen': (context) => const PunishmentScreen(),
            '/profile_screen': (context) => const ProfileScreen(),
            '/player_details_screen': (context) => const PlayerDetailsScreen(),
            '/add_contract_screen': (context) => const AddContractScreen(),
            '/add_match_screen': (context) => const AddMatchScreen(),
            '/matches_list_screen': (context) => const MatchesListScreen(),
            '/matches_details_screen': (context) => const MatchesDetailsScreen(),
            '/add_user_screen': (context) => const AddUserScreen(),
            '/add_player_screen': (context) => const AddPlayerScreen(),
            '/add_medical_screen': (context) => const AddMedicalScreen(),
            '/add_management_screen': (context) => const AddManagementScreen(),
            '/player_evaluation_screen': (context) => const PlayerEvaluationScreen(),
            '/sponsor_screen': (context) => const SponsorsScreen(),
            '/news_screen': (context) => const NewsScreen(),
            '/add_new_screen': (context) => const AddNewScreen(),
            '/new_details_screen': (context) => const NewDetailsScreen(),

            // SAFF Screens
            '/saff_launch_screen': (context) => const SaffLaunchScreen(),
            '/saff_signup_screen': (context) => const SaffSignUpScreen(),
            '/saff_signin_screen': (context) => const SaffSignInScreen(),
            '/saff_view_screen': (context) => const SaffViewScreen(),
            '/teams_screen': (context) => const TeamsScreen(),
            '/add_team_screen': (context) => const AddTeamScreen(),
            '/saff_punishment_screen': (context) =>
                const SaffPunishmentScreen(),
            '/add_punishments_screen': (context) => const AddPunishmentScreen(),
            '/team_player_screen': (context) => const TeamPlayerScreen(),
            '/saff_player_details_screen': (context) =>
                const SaffPlayerDetailsScreen(),

            // Player Screens
            '/player_launch_screen': (context) => const PlayerLaunchScreen(),
            '/player_signin_screen': (context) => const PlayerSignInScreen(),
            '/player_signup_screen': (context) => const PlayerSignUpScreen(),
            '/player_view_screen': (context) => const PlayerViewScreen(),
            '/player_news_screen': (context) => const PlayerNewsScreen(),
            '/player_new_details_screen': (context) => const PlayerNewDetailsScreen(),
            '/player_contracts_screen': (context) => const PlayerContractsScreen(),
            '/contract_details_screen': (context) => const ContractDetailsScreen(),
            '/my_contract_screen': (context) => const MyContractScreen(),
            '/matches_screen': (context) => const MatchesScreen(),
            '/player_profile_screen': (context) => const PlayerProfileScreen(),

            // Visitor Screens
            '/visitor_launch_screen': (context) => const VisitorLaunchScreen(),
            '/visitor_signin_screen': (context) => const VisitorSignInScreen(),
            '/visitor_signup_screen': (context) => const VisitorSignUpScreen(),
            '/visitor_view_screen': (context) => const VisitorViewScreen(),
            '/visitor_news_screen': (context) => const VisitorNewsScreen(),
            '/favorites_screen': (context) => const FavoritesScreen(),
            '/visitor_profile_screen': (context) => const VisitorProfileScreen(),
            '/edit_profile_screen': (context) => const EditProfileScreen(),
          },
        );
      },
    );
  }
}
