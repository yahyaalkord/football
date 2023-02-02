import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/widget/app_button.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerEvaluationScreen extends StatefulWidget {
  const PlayerEvaluationScreen({Key? key}) : super(key: key);

  @override
  State<PlayerEvaluationScreen> createState() => _PlayerEvaluationScreenState();
}

class _PlayerEvaluationScreenState extends State<PlayerEvaluationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Player Evaluation '),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Player evaluation',
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 20.h, bottom: 99.h),
              child: Container(
                height: 49.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: const Color(0xFFF4F6FC),
                ),
                child: Center(
                  child: RatingBar.builder(
                    unratedColor: Colors.black.withOpacity(0.30),
                    initialRating: 8,
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
              ),
            ),
            AppButton(
              text: 'Edit Player Evaluation',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
