import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/api_controller/player_process_api_controller.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/player_contacts.dart';
import 'package:football/player_screen/contract_details_screen.dart';
import 'package:football/widget/player_contract_item.dart';

class PlayerContractsScreen extends StatefulWidget {
  const PlayerContractsScreen({Key? key}) : super(key: key);

  @override
  State<PlayerContractsScreen> createState() => _PlayerContractsScreenState();
}

class _PlayerContractsScreenState extends State<PlayerContractsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Contracts'),
      ),
      body: FutureBuilder<List<PlayerContracts>>(
        future: PlayerProcessApiController().getPlayerContracts(),
        builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(color: AppColors.primary),);
        }else if(snapshot.hasData&&snapshot.data!.isNotEmpty){
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) => SizedBox(height: 30.h),
            itemBuilder: (context, index) {
              return PlayerContractItem(
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ContractDetailsScreen(contract: snapshot.data![index]);
                    },)),
                img: 'assets/images/club.png',
                name: snapshot.data![index].teamName,
                startDate: snapshot.data![index].startDate,
                endDate: snapshot.data![index].endDate,
              );
            },
          );
        }else{
          return SizedBox();
        }
      },)
    );
  }
}
