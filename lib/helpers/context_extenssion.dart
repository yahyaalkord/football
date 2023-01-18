import 'package:flutter/material.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

extension ContextExtension on BuildContext {
  void showSnackBar({required String message, bool error = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: error ? Colors.red.shade800 : AppColors.primary,
        dismissDirection: DismissDirection.horizontal,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
