import 'package:flutter/material.dart';
import 'package:football/helpers/app_colors.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.16),
              blurRadius: 6,
              offset: const Offset(0, 3))
        ],
      ),
      child: FloatingActionButton(
        mini: true,
        onPressed: onPressed,
        backgroundColor: AppColors.primary,
        elevation: 0,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
