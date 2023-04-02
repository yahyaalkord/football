import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/model/users.dart';
import 'package:football/widget/custom_details.dart';

class SaffPlayerDetailsScreen extends StatefulWidget {
  const SaffPlayerDetailsScreen({required this.playet,Key? key}) : super(key: key);
  final PlayerModel playet;

  @override
  State<SaffPlayerDetailsScreen> createState() =>
      _SaffPlayerDetailsScreenState();
}

class _SaffPlayerDetailsScreenState extends State<SaffPlayerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Details'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children:  [
          CustomDetails(
            isData: widget.playet.image!=null?true:false,
            img: widget.playet.image??'',
            name: widget.playet.name,
            evaluation: double.parse(widget.playet.rate.toString()),
            startDate: widget.playet.startDate,
            endDate: widget.playet.endDate,
          ),
        ],
      ),
    );
  }
}
