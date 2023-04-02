import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/api_controller/player_process_api_controller.dart';
import 'package:football/helpers/app_colors.dart';
import 'package:football/model/news_model.dart';
import 'package:football/player_screen/player_new_details_screen.dart';
import 'package:football/widget/player_new_item.dart';

class PlayerNewsScreen extends StatefulWidget {
  const PlayerNewsScreen({Key? key}) : super(key: key);

  @override
  State<PlayerNewsScreen> createState() => _PlayerNewsScreenState();
}

class _PlayerNewsScreenState extends State<PlayerNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: FutureBuilder<List<NewsModel>>(
        future: PlayerProcessApiController().playersNews(),
        builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(color: AppColors.primary,),);
        }else if(snapshot.hasData&&snapshot.data!.isNotEmpty){
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemBuilder: (context, index) {
              return PlayerNewItem(
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return PlayerNewDetailsScreen(news: snapshot.data![index]);
                    },)),
                isData: snapshot.data![index].image!=null?true:false,
                img: snapshot.data![index].image??'',
                title: snapshot.data![index].title,
                dec: snapshot.data![index].description,
                date: snapshot.data![index].date,
              );
            },
          );
        }else{
         return SizedBox();
        }
      },)
    );
  }
}