import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/dropdow_model.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/app_text_field.dart';
import 'package:football/widget/drop_down.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPunishmentScreen extends StatefulWidget {
  const AddPunishmentScreen({Key? key}) : super(key: key);

  @override
  State<AddPunishmentScreen> createState() => _AddPunishmentScreenState();
}

class _AddPunishmentScreenState extends State<AddPunishmentScreen> {
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
              sizedBox: 9,
              horizontalPad: 13,
              title: 'Punishment Title:',
              hint: 'Punishment title',
              keyboardType: TextInputType.name,
              controller: _titleController),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 21.h,bottom: 9.h),
            child: Text(
              'Punishment for team:',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black),
            ),
          ),
          DropdownPunishment(
              onPressed: () {},
              itemsTitle: _punishment,
              valueTitle: selectedPunishment),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 21.h,bottom: 33.h),
            child: AppTextField(
                isColumn: true,
                sizedBox: 9,
                height: 138,
                horizontalPad: 13,
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
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
