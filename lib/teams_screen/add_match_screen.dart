import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football/helpers/context_extenssion.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/app_text_field.dart';

class AddMatchScreen extends StatefulWidget {
  const AddMatchScreen({Key? key}) : super(key: key);

  @override
  State<AddMatchScreen> createState() => _AddMatchScreenState();
}

class _AddMatchScreenState extends State<AddMatchScreen> {
  late TextEditingController _dateController;
  late TextEditingController _timeController;
  late TextEditingController _teamAController;
  late TextEditingController _teamBController;
  late TextEditingController _stadiumController;
  late TextEditingController _refereeController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    _timeController = TextEditingController();
    _teamAController = TextEditingController();
    _teamBController = TextEditingController();
    _stadiumController = TextEditingController();
    _refereeController = TextEditingController();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _teamAController.dispose();
    _teamBController.dispose();
    _stadiumController.dispose();
    _refereeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Match'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: [
          AppTextField(
              horizontalPad: 13,
              isColumn: true,
              title: 'Match Date',
              hint: 'Choose date',
              suffixIcon: SvgPicture.asset(
                'assets/svg_images/date.svg',
                width: 18.w,
                height: 20.h,
              ),
              keyboardType: TextInputType.datetime,
              controller: _dateController),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 21.h),
            child: AppTextField(
                horizontalPad: 13,
                isColumn: true,
                title: 'Match Time',
                hint: 'Choose time',
                suffixIcon: SvgPicture.asset(
                  'assets/svg_images/time.svg',
                  width: 20.w,
                  height: 20.h,
                ),
                keyboardType: TextInputType.datetime,
                controller: _timeController),
          ),
          AppTextField(
              horizontalPad: 13,
              isColumn: true,
              title: 'Team A',
              hint: 'Team name',
              keyboardType: TextInputType.name,
              controller: _teamAController),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 21.h),
            child: AppTextField(
                horizontalPad: 13,
                isColumn: true,
                title: 'Team B',
                hint: 'Team name',
                keyboardType: TextInputType.name,
                controller: _teamBController),
          ),
          AppTextField(
              horizontalPad: 13,
              isColumn: true,
              title: 'Stadium',
              hint: 'Stadium name',
              keyboardType: TextInputType.name,
              controller: _stadiumController),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 21.h, bottom: 34.h),
            child: AppTextField(
                horizontalPad: 13,
                isColumn: true,
                title: 'Referee',
                hint: 'referee name',
                keyboardType: TextInputType.name,
                controller: _refereeController),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: AppButton(
              text: 'Add Match',
              onPressed: () => _performAdd(),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Future<void> _performAdd() async {
    if (_checkData()) {
      await _addMatch();
    }
  }

  bool _checkData() {
    if (_dateController.text.isNotEmpty &&
        _timeController.text.isNotEmpty &&
        _teamAController.text.isNotEmpty &&
        _teamBController.text.isNotEmpty &&
        _stadiumController.text.isNotEmpty &&
        _refereeController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter Required Data', error: true);
    return false;
  }

  Future<void> _addMatch() async {
    Navigator.pop(context);
  }
}
