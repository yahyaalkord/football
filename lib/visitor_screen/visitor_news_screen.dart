import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/get/visitor_getx_controller.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/widget/player_new_item.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VisitorNewsScreen extends StatefulWidget {
  const VisitorNewsScreen({Key? key}) : super(key: key);

  @override
  State<VisitorNewsScreen> createState() => _VisitorNewsScreenState();
}

class _VisitorNewsScreenState extends State<VisitorNewsScreen> {
  VisitorGetxController controller =
      Get.put<VisitorGetxController>(VisitorGetxController());
  List<String> club = <String>[
    'All clubs',
    'Club name',
    'Club name',
    'Club name',
  ];
  int? tabIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: [
          ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 38.h,
                maxWidth: double.infinity,
              ),
              child: GetBuilder<VisitorGetxController>(
                builder: (controller) {
                  if (controller.loading == true) {
                    return SizedBox();
                  } else if (controller.teams.isNotEmpty) {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              tabIndex=null;
                            });
                            controller.read();
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 50),
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: tabIndex == null?AppColors.primary: Color(0xFFF4F6FC),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  SizedBox(width: 3.w),
                                  Text(
                                    'All clubs',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: tabIndex == null
                                          ? AppColors.white
                                          : AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w,),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 5.w,
                            );
                          },
                          itemCount: controller.teams.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onDoubleTap: () {
                                controller.visitorFavoriteTeam(
                                    id: controller.teams[index].id);
                              },
                              onTap: () {
                                setState(() {
                                  tabIndex = index;
                                });
                                controller.readTeam(id: controller.teams[index].id);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 50),
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: tabIndex == index
                                      ? AppColors.primary
                                      : const Color(0xFFF4F6FC),
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      controller.teams[index].isFavorite? SvgPicture.asset('assets/svg_images/Star.svg',
                                          color: const Color(0xFFE28924),
                                          width: 20.w, height: 19.h):SvgPicture.asset(
                                          'assets/svg_images/Star.svg',
                                          width: 20.w,
                                          height: 19.h),
                                      SizedBox(width: 3.w),
                                      Text(
                                        controller.teams[index].name,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: tabIndex == index
                                              ? AppColors.white
                                              : AppColors.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return SizedBox();
                  }
                },
              )),
          GetBuilder<VisitorGetxController>(
            builder: (controller) {
              if (controller.loading == true) {
                return Center(child: Column(
                  children: [
                    SizedBox(height: 100.h,),
                    CircularProgressIndicator(color: AppColors.primary,),
                  ],
                ),);
              } else if (controller.news.isNotEmpty) {
                return ListView.separated(
                  padding: EdgeInsetsDirectional.only(top: 10.h),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.news.length,
                  separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  itemBuilder: (context, index) {
                    return PlayerNewItem(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/player_new_details_screen'),
                      isData: controller.news[index].image!=null?true:false,
                      img: controller.news[index].image??'',
                      title: controller.news[index].title,
                      dec:controller.news[index].description,
                      date: controller.news[index].date,
                    );
                  },
                );
              } else {
                return SizedBox();
              }
            },
          )

        ],
      ),
    );
  }
}
