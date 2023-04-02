import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/model/news_model.dart';
import 'package:football/widget/player_new_det_item.dart';

class NewDetailsScreen extends StatefulWidget {
  const NewDetailsScreen({required this.news,Key? key}) : super(key: key);
  final NewsModel news;

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
        children:  [
          playerNewDetItem(
            isData: widget.news.image!=null?true:false,
            img: widget.news.image??'',
            title: widget.news.title,
            date: widget.news.date,
            dec:widget.news.date,
          ),
        ],
      ),
    );
  }
}
