import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.backgroundColor = AppColors.primary,
    this.iconColor = AppColors.white,
    this.radius = 12,
    this.sizeIcon = 12,
    this.icon = Icons.arrow_forward_ios,
    required this.onPressed,
  }) : super(key: key);
  final Color backgroundColor;
  final Color iconColor;
  final double radius;
  final double sizeIcon;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius.r,
      backgroundColor: backgroundColor,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
          size: sizeIcon,
        ),
      ),
    );
  }
}
