import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/dropdow_model.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/app_text_field.dart';
import 'package:football/widget/drop_down.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMedicalScreen extends StatefulWidget {
  const AddMedicalScreen({Key? key}) : super(key: key);

  @override
  State<AddMedicalScreen> createState() => _AddMedicalScreenState();
}

class _AddMedicalScreenState extends State<AddMedicalScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _mobileController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _mobileController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  final List<DropdownModel> _specialization = <DropdownModel>[
    DropdownModel(id: 1, title: 'specialization'),
    DropdownModel(id: 2, title: 'specialization'),
    DropdownModel(id: 3, title: 'specialization'),
  ];
  int? selectedSpecialization;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medical team'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: [
          AppTextField(
              isColumn: true,
              title: 'Name',
              hint: 'name',
              keyboardType: TextInputType.name,
              controller: _nameController),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 17.h),
            child: AppTextField(
                isColumn: true,
                title: 'Email',
                hint: 'email',
                keyboardType: TextInputType.emailAddress,
                controller: _emailController),
          ),
          AppTextField(
              isColumn: true,
              title: 'Mobile',
              hint: 'mobile',
              keyboardType: TextInputType.emailAddress,
              controller: _emailController),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 17.h),
            child: AppTextField(
                isColumn: true,
                title: 'Password',
                hint: '*******',
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController),
          ),
          Text(
            'Specialization',
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black),
          ),
          SizedBox(height: 8.h),
          CustomDropdown(
            hint: 'specialization',
              onPressed: () {},
              itemsTitle: _specialization,
              valueTitle: selectedSpecialization),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: 34.h, bottom: 30.h, start: 14.w, end: 14.w),
            child: AppButton(
              text: 'Add Medical User',
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
