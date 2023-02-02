import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/context_extenssion.dart';
import 'package:football/widget/app_button.dart';
import 'package:football/widget/app_text_field.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(
                top: 30.h, bottom: 50.h, start: 40.w, end: 40.w),
            width: double.infinity,
            height: 240.h,
            child: SvgPicture.asset(
              'assets/svg_images/contact1.svg',
              fit: BoxFit.fill,
            ),
          ),
          AppTextField(
            hint: 'Username',
            keyboardType: TextInputType.name,
            controller: _nameController,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: AppTextField(
              hint: 'Email',
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
          ),
          AppTextField(
            hint: 'Message',
            keyboardType: TextInputType.text,
            controller: _messageController,
            height: 130,
            minLines: 6,
            maxLines: 7,
            verticalPad: 10,
          ),
          SizedBox(height: 50.h),
          AppButton(
            text: 'save',
            onPressed: () => _performContactUs(),
          ),
        ],
      ),
    );
  }

  Future<void> _performContactUs() async {
    if (_checkData()) {
      await _contactUs();
    }
  }

  bool _checkData() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _messageController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter Required Data', error: true);
    return false;
  }

  Future<void> _contactUs() async {
    Navigator.pop(context);
    context.showSnackBar(message: 'Your Message Send Successfully');
  }
}
