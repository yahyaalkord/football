import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/api_controller/team_process_api_controller.dart';
import 'package:football/get/team_process_getx_controller.dart';
import 'package:football/helpers/api_response.dart';
import 'package:football/helpers/context_extenssion.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/app_text_field.dart';
import 'package:football/widget/calender_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({Key? key}) : super(key: key);

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  TeamProcessGetxController controller =TeamProcessGetxController.to;
  late TextEditingController _titleController;
  late TextEditingController _dateController;
  late TextEditingController _desController;
  late TextEditingController _photoController;
  DateTime today = DateTime.now();
  String date = 'Choose date';
  PlatformFile? pickFile;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _dateController = TextEditingController();
    _desController = TextEditingController();
    _photoController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _desController.dispose();
    _photoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: [
          AppTextField(
              isColumn: true,
              title: 'New title',
              hint: 'New title',
              keyboardType: TextInputType.text,
              controller: _titleController),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: AppTextField(
                onClicked: () => _openCalender(),
                  readOnly: true,
                  isColumn: true,
                  title: 'New Date',
                  hint: date,
                  suffixIcon: SvgPicture.asset(
                    'assets/svg_images/date.svg',
                    width: 18.w,
                    height: 20.h,
                  ),
                  keyboardType: TextInputType.datetime,
                  controller: _dateController)),
          AppTextField(
              isColumn: true,
              height: 151,
              verticalPad: 20,
              minLines: 10,
              maxLines: 12,
              title: 'New description',
              hint: 'Description',
              keyboardType: TextInputType.text,
              controller: _desController),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 16.h, bottom: 75.h),
            child: InkWell(
              onTap: () async{
                await selectFile();
              },
              child: AppTextField(
                  readOnly: true,
                  isColumn: true,
                  title: 'New Photo',
                  hint: 'Add photo',
                  suffixIcon: SvgPicture.asset(
                    'assets/svg_images/photo.svg',
                    width: 20.w,
                    height: 20.h,
                  ),
                  keyboardType: TextInputType.name,
                  controller: _photoController),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: AppButton(
              text: 'Add New',
              onPressed: () async{
                await createNews();
              },
            ),
          ),
        ],
      ),
    );
  }
  void _openCalender() async {
    showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CalenderDialog(
            focusedDay: today,
            selectedDay: (day) => isSameDay(day, today),
            onDaySelected: (DateTime day, DateTime focusDat) {
              setState(() {
                today = day;
                date = today.toString().split(' ')[0];
                _dateController.text=date;
                Navigator.pop(context);
              });
            },
          );
        });
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if(result == null)return;
    setState(() {
      pickFile = result.files.first;
      _photoController.text=pickFile!.name;
    });
  }

  Future<void> createNews() async{
    if(pickFile !=null&&_titleController.text.isNotEmpty&&_desController.text.isNotEmpty&&_dateController.text.isNotEmpty){
      ApiResponse apiResponse =await TeamProcessApiController().createNews(image: File(pickFile!.path!), title: _titleController.text, description: _desController.text, date: date);
      if(apiResponse.success){
        controller.getTeamNews();
        context.showSnackBar(message: apiResponse.message);
        Navigator.pop(context);
      }else{
        context.showSnackBar(message: apiResponse.message,error: true);
      }
    }
  }
}
