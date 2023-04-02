import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/get/team_process_getx_controller.dart';
import 'package:football/teams_screen/new_details_screen.dart';
import 'package:football/widget/custom_floating_button.dart';
import 'package:football/widget/new_item.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../helpers/app_colors.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  TeamProcessGetxController controller =TeamProcessGetxController.to;
  @override
  void initState() {
    controller.getTeamNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: GetBuilder<TeamProcessGetxController>(
        builder: (TeamProcessGetxController controller) {
          if(controller.loading==true){
            return Center(child: Column(
              children: [
                SizedBox(height: 100.h,),
                CircularProgressIndicator(color: AppColors.primary,),
              ],
            ),);
          }else if(controller.news.isNotEmpty){
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 16.w),
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemCount: controller.news.length,
              itemBuilder: (context, index) {
                return NewItem(
                  isData: controller.news[index].image!=null?true:false,
                  img: controller.news[index].image??'',
                  name: controller.news[index].title,
                  dec:controller.news[index].description,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return NewDetailsScreen(news: controller.news[index]);
                    },));
                  },
                );
              },
            );
          }else {
            return SizedBox();
          }
        },),

      floatingActionButton: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 70.h),
        child: CustomFloatingButton(
          onPressed: () => Navigator.pushNamed(context, '/add_new_screen'),
        ),
      ),
    );
  }
}
