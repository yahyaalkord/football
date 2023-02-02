import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/custom_floating_button.dart';
import 'package:football/widget/new_item.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 16.w),
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemCount: 4,
        itemBuilder: (context, index) {
          return NewItem(
            img: 'assets/images/user3.png',
            name: 'New Title',
            dec:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
            onPressed: () {
              Navigator.pushNamed(context, '/new_details_screen');
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 70.h),
        child: CustomFloatingButton(
          onPressed: () => Navigator.pushNamed(context, '/add_team_screen'),
        ),
      ),
    );
  }
}
