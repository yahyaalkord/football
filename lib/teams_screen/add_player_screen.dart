import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football/api_controller/team_process_api_controller.dart';
import 'package:football/helpers/api_response.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/context_extenssion.dart';
import 'package:football/model/dropdow_model.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/app_text_field.dart';
import 'package:football/widget/calender_dialog.dart';
import 'package:football/widget/drop_down.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../get/team_process_getx_controller.dart';

class AddPlayerScreen extends StatefulWidget {
  const AddPlayerScreen({Key? key}) : super(key: key);

  @override
  State<AddPlayerScreen> createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends State<AddPlayerScreen> {
  TeamProcessGetxController controller = TeamProcessGetxController.to;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _birthdayController;
  late TextEditingController _beginningController;
  late TextEditingController _endController;
  late TextEditingController _fileController;
  late TextEditingController _natioController;
  late TextEditingController _imageController;
  PlatformFile? pickFile;
  PlatformFile? pickFile1;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _birthdayController = TextEditingController();
    _beginningController = TextEditingController();
    _endController = TextEditingController();
    _fileController = TextEditingController();
    _natioController = TextEditingController();
    _imageController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _birthdayController.dispose();
    _beginningController.dispose();
    _endController.dispose();
    _fileController.dispose();
    _natioController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  final List<DropdownModel> _nationality = <DropdownModel>[
    DropdownModel(id: 1, title: 'nationality'),
    DropdownModel(id: 2, title: 'nationality'),
    DropdownModel(id: 3, title: 'nationality'),
  ];
  int? selectedNationality;
  DateTime today = DateTime.now();
  String birthday = 'Choose date';
  String beginning = 'Choose date';
  String end = 'Choose date';
  double rateA = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Player'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: [
          AppTextField(
              isColumn: true,
              title: 'Player name',
              hint: 'player name',
              keyboardType: TextInputType.name,
              controller: _nameController),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 23.h),
            child: AppTextField(
                isColumn: true,
                title: 'Player email',
                hint: 'player email',
                keyboardType: TextInputType.emailAddress,
                controller: _emailController),
          ),
          AppTextField(
              isColumn: true,
              title: 'Password',
              hint: '*******',
              keyboardType: TextInputType.visiblePassword,
              controller: _passwordController),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 23.h),
            child: AppTextField(
                onClicked: () => _chooseBirthday(),
                readOnly: true,
                isColumn: true,
                title: 'Player birthday',
                hint: birthday,
                suffixIcon: SvgPicture.asset(
                  'assets/svg_images/date.svg',
                  width: 18.w,
                  height: 20.h,
                ),
                keyboardType: TextInputType.datetime,
                controller: _birthdayController),
          ),
          SizedBox(height: 8.h),
          AppTextField(
              isColumn: true,
              title: 'Player nationality',
              hint: 'Player nationality',
              keyboardType: TextInputType.name,
              controller: _natioController),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 23.h),
            child: AppTextField(
                onClicked: () => _beginningDate(),
                readOnly: true,
                isColumn: true,
                title: 'Beginning of the contract ',
                hint: beginning,
                suffixIcon: SvgPicture.asset(
                  'assets/svg_images/date.svg',
                  width: 18.w,
                  height: 20.h,
                ),
                keyboardType: TextInputType.datetime,
                controller: _beginningController),
          ),
          AppTextField(
              onClicked: () => _endDate(),
              readOnly: true,
              isColumn: true,
              title: 'End of the contract ',
              hint: end,
              suffixIcon: SvgPicture.asset(
                'assets/svg_images/date.svg',
                width: 18.w,
                height: 20.h,
              ),
              keyboardType: TextInputType.datetime,
              controller: _endController),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 23.h, bottom: 24.h),
            child: InkWell(
              onTap: () async {
                await selectFile();
              },
              child: AppTextField(
                  readOnly: true,
                  isColumn: true,
                  title: 'Contract file',
                  hint: 'Add file',
                  suffixIcon: SvgPicture.asset(
                    'assets/svg_images/file.svg',
                    width: 18.w,
                    height: 20.h,
                  ),
                  keyboardType: TextInputType.datetime,
                  controller: _fileController),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 23.h, bottom: 24.h),
            child: InkWell(
              onTap: () async {
                await selectImage();
              },
              child: AppTextField(
                  readOnly: true,
                  isColumn: true,
                  title: 'image ',
                  hint: 'Add image',
                  suffixIcon: SvgPicture.asset(
                    'assets/svg_images/file.svg',
                    width: 18.w,
                    height: 20.h,
                  ),
                  keyboardType: TextInputType.datetime,
                  controller: _imageController),
            ),
          ),
          Text(
            'Player evaluation',
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black),
          ),
          SizedBox(height: 16.h),
          Center(
            child: RatingBar.builder(
              unratedColor: Colors.black.withOpacity(0.30),
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              itemSize: 25,
              allowHalfRating: true,
              itemCount: 10,
              itemPadding: EdgeInsets.symmetric(horizontal: 5.w),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Color(0xFFE28924),
              ),
              onRatingUpdate: (value) {
                setState(() {
                  rateA = value;
                });
                print(rateA);
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: 34.h, bottom: 30.h, start: 14.w, end: 14.w),
            child: AppButton(
              text: 'Add Player & make contract',
              onPressed: () async => await addPlayer(),
            ),
          ),
        ],
      ),
    );
  }

  void _chooseBirthday() async {
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
                birthday = today.toString().split(' ')[0];
                _birthdayController.text = birthday;
                Navigator.pop(context);
              });
            },
          );
        });
  }

  void _beginningDate() async {
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
                beginning = today.toString().split(' ')[0];
                _beginningController.text = beginning;
                Navigator.pop(context);
              });
            },
          );
        });
  }

  void _endDate() async {
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
                end = today.toString().split(' ')[0];
                _endController.text = end;
                Navigator.pop(context);
              });
            },
          );
        });
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickFile = result.files.first;
      _fileController.text = pickFile!.name;
    });
  }

  Future selectImage() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickFile1 = result.files.first;
      _imageController.text = pickFile1!.name;
    });
  }

  Future<void> addPlayer() async {
    if (pickFile != null &&
        pickFile1 != null &&
        _nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _natioController.text.isNotEmpty &&
        _birthdayController.text.isNotEmpty&&
    _beginningController.text.isNotEmpty&&_endController.text.isNotEmpty&&_imageController.text.isNotEmpty) {
      ApiResponse apiResponse = await TeamProcessApiController()
          .teamPlayerCreate(
              file: File(pickFile!.path!),
              image: File(pickFile1!.path!),
              name: _nameController.text,
              email: _emailController.text,
              password: _passwordController.text,
              nationality: _natioController.text,
              birth_date: birthday,
              start_date: beginning,
              end_date: end,
              type: 'Player',
              rate: rateA.toString());
      if (apiResponse.success) {
        controller.readTeam(type: 'players');
        context.showSnackBar(
          message: apiResponse.message,
        );
        Navigator.pop(context);
      } else {
        context.showSnackBar(message: apiResponse.message, error: true);
      }
    } else {
      context.showSnackBar(message: 'check your required data!', error: true);
    }
  }
}
