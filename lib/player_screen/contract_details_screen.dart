import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/api_controller/player_process_api_controller.dart';
import 'package:football/helpers/api_response.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/context_extenssion.dart';
import 'package:football/model/player_contacts.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/custom_contract.dart';
import 'package:url_launcher/url_launcher.dart';

class ContractDetailsScreen extends StatefulWidget {
  const ContractDetailsScreen({required this.contract,Key? key}) : super(key: key);
  final PlayerContracts contract;

  @override
  State<ContractDetailsScreen> createState() => _ContractDetailsScreenState();
}

class _ContractDetailsScreenState extends State<ContractDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(title: const Text('Contracts details')),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
            start: 16.w, end: 16.w, top: 50.h, bottom: 25.h),
        children: [
           CustomContract(
            img: 'assets/images/club.png',
            name: widget.contract.teamName,
            startDate: widget.contract.startDate,
            endDate: widget.contract.endDate,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: 81.h, bottom: 16.h, start: 14.w, end: 14.w),
            child: AppButton(
              text: 'Download Contract File',
              onPressed: () async{
                final Uri url = Uri.parse(widget.contract.fileUrl);
                if (await canLaunchUrl(url)) {
                await launchUrl(url);
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: AppButton(
              text: 'Accept Contract',
              onPressed: () async{
                ApiResponse apiResponse = await PlayerProcessApiController().acceptContracts(id: widget.contract.id);
                if(apiResponse.success){
                  context.showSnackBar(message: apiResponse.message);
                  Navigator.pop(context);
                }else{
                  context.showSnackBar(message: apiResponse.message,error: true);
                }
              },
            ),
          ),
          Padding(
            padding:
                EdgeInsetsDirectional.only(top: 16.h, start: 14.w, end: 14.w),
            child: AppButton(
              text: 'Reject Contract',
              onPressed: () async{
                ApiResponse apiResponse = await PlayerProcessApiController().rejectedContracts(id: widget.contract.id);
                if(apiResponse.success){
                  context.showSnackBar(message: apiResponse.message);
                  Navigator.pop(context);
                }else{
                  context.showSnackBar(message: apiResponse.message,error: true);
                }
              },
              backgroundColor: const Color(0xFFBC2F2F),
            ),
          ),
        ],
      ),
    );
  }
}
