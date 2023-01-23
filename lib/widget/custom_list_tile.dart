import 'package:flutter/material.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/widget/custom_button.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    required this.onPressed,
    this.divider = true,
  }) : super(key: key);
  final String title;
  final void Function() onPressed;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0,
          title: Text(
            title,
            style: AppTextStyle.subTitleBlack,
          ),
          trailing: CustomButton(
            radius: 15,
            sizeIcon: 15,
            onPressed: onPressed,
            backgroundColor: AppColors.primary.withOpacity(0.40),
            iconColor: AppColors.primary,
          ),
        ),
        divider ? Divider(
          color: const Color(0xFFBBBBBB).withOpacity(0.30),
          thickness: 1.5,
          height: 0,
        ) : const SizedBox()
      ],
    );
  }
}
