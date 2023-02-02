import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/dropdow_model.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/app_text_field.dart';
import 'package:football/widget/calender_dialog.dart';
import 'package:football/widget/drop_down.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class AddPlayerScreen extends StatefulWidget {
  const AddPlayerScreen({Key? key}) : super(key: key);

  @override
  State<AddPlayerScreen> createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends State<AddPlayerScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _birthdayController;
  late TextEditingController _beginningController;
  late TextEditingController _endController;
  late TextEditingController _fileController;

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
          Text(
            'Player nationality',
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black),
          ),
          SizedBox(height: 8.h),
          CustomDropdown(
            hint: 'nationality',
              onPressed: () {},
              itemsTitle: _nationality,
              valueTitle: selectedNationality),
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
              onRatingUpdate: (value) {},
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: 34.h, bottom: 30.h, start: 14.w, end: 14.w),
            child: AppButton(
              text: 'Add Player & make contract',
              onPressed: () => Navigator.pop(context),
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
                Navigator.pop(context);
              });
            },
          );
        });
  }

}
