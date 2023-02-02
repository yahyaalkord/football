import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/app_text_field.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({Key? key}) : super(key: key);

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  late TextEditingController _titleController;
  late TextEditingController _dateController;
  late TextEditingController _desController;
  late TextEditingController _photoController;

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
              hint: 'new title',
              keyboardType: TextInputType.text,
              controller: _titleController),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: AppTextField(
                  readOnly: true,
                  isColumn: true,
                  title: 'New Date',
                  hint: 'Choose date',
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
              hint: 'description',
              keyboardType: TextInputType.text,
              controller: _desController),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 16.h, bottom: 75.h),
            child: AppTextField(
                readOnly: true,
                isColumn: true,
                title: 'New Photo',
                hint: 'add photo',
                suffixIcon: SvgPicture.asset(
                  'assets/svg_images/photo.svg',
                  width: 20.w,
                  height: 20.h,
                ),
                keyboardType: TextInputType.name,
                controller: _photoController),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: AppButton(
              text: 'Add New',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
