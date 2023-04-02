import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/context_extenssion.dart';
import 'package:football/model/admid_all_team.dart';
import 'package:football/model/dropdow_model.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/app_text_field.dart';
import 'package:football/widget/drop_down.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api_controller/saff_process_api_controller.dart';
import '../get/saff_process_getx_controller.dart';
import '../helpers/api_response.dart';

class AddPunishmentScreen extends StatefulWidget {
  const AddPunishmentScreen({Key? key}) : super(key: key);

  @override
  State<AddPunishmentScreen> createState() => _AddPunishmentScreenState();
}

class _AddPunishmentScreenState extends State<AddPunishmentScreen> {
  SaffProcessGetxController controller = SaffProcessGetxController.to;
  late TextEditingController _titleController;
  late TextEditingController _detailsController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _detailsController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  final List<DropdownModel> _punishment = <DropdownModel>[
    DropdownModel(id: 1, title: 'team name'),
    DropdownModel(id: 2, title: 'team name'),
    DropdownModel(id: 3, title: 'team name'),
  ];
  int? selectedPunishment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Punishment'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: [
          AppTextField(
              isColumn: true,
              sizedBox: 13,
              title: 'Punishment Title:',
              hint: 'Punishment title',
              keyboardType: TextInputType.name,
              controller: _titleController),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 30.h,bottom: 13.h),
            child: Text(
              'Punishment for team:',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black),
            ),
          ),
          GetBuilder<SaffProcessGetxController>(
            builder: (SaffProcessGetxController controller) {
              List<AdminAllTeam> team = controller.allTeam;
              if (controller.loading == true) {
                return CustomDropdown<int>(
                    hint: 'Waiting',
                    onChanged:(p0) {

                    },
                    items: [],
                    valueTitle: 0);
              } else if (team.isNotEmpty) {
                return CustomDropdown<int>(
                    hint: 'team name',
                    onChanged:(int? value) {
                      setState(() {
                        selectedPunishment = value;
                      });
                    },
                    items: team.map((emp) {
                      return DropdownMenuItem(
                        value: emp.id,
                        child: Text(emp.name),
                      );
                    }).toList(),
                    valueTitle: selectedPunishment);
              } else {
                return SizedBox();
              }
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 30.h,bottom: 32.h),
            child: AppTextField(
                isColumn: true,
                sizedBox: 13,
                height: 138,
                verticalPad: 20,
                minLines: 10,
                maxLines: 12,
                title: 'Punishment Details:',
                hint: 'Punishment details',
                keyboardType: TextInputType.name,
                controller: _detailsController),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: AppButton(
              text: 'Add Punishment',
              onPressed: () async{
                await _performAdd();
              },
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _performAdd() async {
    if (_checkData()) {
      await _add();
    }
  }

  bool _checkData() {
    if (_titleController.text.isNotEmpty &&
        _detailsController.text.isNotEmpty &&
        selectedPunishment!=null) {
      return true;
    } else {
      context.showSnackBar(
          message: 'Please complete the required data!', error: true);
      return false;
    }
  }

  Future<void> _add() async {
    ApiResponse apiResponse = await SaffProcessApiController().adminCreatePunishments(title: _titleController.text, description: _detailsController.text, teamId: selectedPunishment!.toString());
    if(apiResponse.success){
      context.showSnackBar(message: apiResponse.message);
      controller.readPunishments();
      Future.delayed(Duration(seconds: 1),(){
        Navigator.pop(context);
      });
    }else{
      context.showSnackBar(message: apiResponse.message,error: !apiResponse.success);
    }
  }
}
