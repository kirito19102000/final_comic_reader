
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';
import 'comic_on_day_grid_view.dart';
import 'title_with_more_btn.dart';
import 'unlock_comic_recommend.dart';

class DailyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  Container(
      color: Colors.white,

      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            child: Row(
              children: [
                Text("10 item"),
                Spacer(),
                Text("data")
              ],
            ),
          ),
          ComicGridView(itemNum: 6),
          GestureDetector(
            onTap: (){
              print("Click event on Container");
            },
            child: Card(elevation:2,child: Image.network("https://photo.techrum.vn/images/2022/01/02/doremon-remake-TECHRUM-cover966645bc9366d3aa.jpg",fit: BoxFit.fitWidth,height: 60,)),
          ),

          ComicGridView(itemNum: 10),

          TitleWithMoreBtn(text: "Unlock episodes for dree every day", press: (){}),

          UnlockComicFreeRecommendGridView(),

        ]
    ),
    );
  }
}

