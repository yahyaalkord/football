import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/widget/player_new_det_item.dart';

class NewDetailsScreen extends StatefulWidget {
  const NewDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NewDetailsScreen> createState() => _NewDetailsScreenState();
}

class _NewDetailsScreenState extends State<NewDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New details')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: const [
          playerNewDetItem(
            img: 'assets/images/new.png',
            title: 'New title',
            date: '13 May 2022',
            dec:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
          ),
        ],
      ),
    );
  }
}
