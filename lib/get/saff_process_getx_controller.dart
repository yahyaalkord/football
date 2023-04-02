
import 'package:flutter/material.dart';
import 'package:football/api_controller/saff_process_api_controller.dart';
import 'package:football/helpers/api_response.dart';
import 'package:football/helpers/context_extenssion.dart';
import 'package:football/model/admid_all_team.dart';
import 'package:football/model/punishments.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SaffProcessGetxController extends GetxController{

  static SaffProcessGetxController get to => Get.find<SaffProcessGetxController>();
  final SaffProcessApiController _saffProcessApiController = SaffProcessApiController();
  List<AdminAllTeam> allTeam =<AdminAllTeam>[];
  List<Punishments> punish =<Punishments>[];

  bool loading = false;


  @override
  void onInit() {
    read();
    super.onInit();
  }

  void read() async {
    loading = true;
    allTeam = await _saffProcessApiController.adminAllTeam();
    loading = false;
    update();
  }

  void readPunishments() async {
    loading = true;
    punish = await _saffProcessApiController.adminPunishments();
    loading = false;
    update();
  }

  Future<void> deleteTeam(BuildContext context,{required int id,required int index}) async{
    ApiResponse apiResponse = await _saffProcessApiController.deleteSearchStoreRecent(id: id);
    if(apiResponse.success){
      allTeam.removeAt(index);
      context.showSnackBar(message: apiResponse.message);
      update();
    }else{
      context.showSnackBar(message: apiResponse.message,error: !apiResponse.success);
    }
  }

  Future<void> deletePunish(BuildContext context,{required int id,required int index}) async{
    ApiResponse apiResponse = await _saffProcessApiController.adminDeletePunishments(id: id);
    if(apiResponse.success){
      punish.removeAt(index);
      context.showSnackBar(message: apiResponse.message);
      update();
    }else{
      context.showSnackBar(message: apiResponse.message,error: !apiResponse.success);
    }
  }
}