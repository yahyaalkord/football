import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/app_text_field.dart';
import 'package:football/widget/custom_details.dart';

class AddContractScreen extends StatefulWidget {
  const AddContractScreen({Key? key}) : super(key: key);

  @override
  State<AddContractScreen> createState() => _AddContractScreenState();
}

class _AddContractScreenState extends State<AddContractScreen> {
  late TextEditingController _fileController;

  @override
  void initState() {
    super.initState();
    _fileController = TextEditingController();
  }

  @override
  void dispose() {
    _fileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contract'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: [
          const CustomDetails(
            img: 'assets/images/user.png',
            name: 'Ahmed Ali',
            evaluation: 8.4,
            about:
                'Lorem Ipsum is simply dummy text of the printing and type setting industry Lorem Ipsum has been the industry\'s',
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 42.h),
            child: AppTextField(
                isColumn: true,
                horizontalPad: 13,
                title: 'Pdf Contract File',
                hint: 'Choose file',
                keyboardType: TextInputType.name,
                suffixIcon: SvgPicture.asset('assets/svg_images/file.svg',width: 17.w, height: 20.h,),
                controller: _fileController),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: AppButton(
              text: 'Add Contract',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
