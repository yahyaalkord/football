import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/helpers/text_style.dart';
import 'package:football/widget/player_new_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> club = <String>[
    'Club name',
    'Club name',
    'Club name',
  ];
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 38.h,
              maxWidth: double.infinity,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 5.w,
                );
              },
              itemCount: club.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      tabIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 50),
                    // width: 123.w,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: const Color(0xFFF4F6FC),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svg_images/Star.svg',
                              color: const Color(0xFFE28924),
                              width: 20.w, height: 19.h),
                          SizedBox(width: 3.w),
                          Text(
                            club[index],
                            style: AppTextStyle.titlePrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ListView.separated(
            padding: EdgeInsetsDirectional.only(top: 10.h),
            shrinkWrap: true,
            itemCount: 2,
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemBuilder: (context, index) {
              return PlayerNewItem(
                onPressed: () =>
                    Navigator.pushNamed(context, '/player_new_details_screen'),
                img: 'assets/images/player.png',
                title: 'Romain club',
                dec:
                    'Romain Perraud scored twice to seal Southampton’s place in the FA Cup fifth round with a 2-1 win over Mick McCarthy’s Blackpool at St Mary’s.',
                date: '2023-1-27',
              );
            },
          ),
        ],
      ),
    );
  }
}
