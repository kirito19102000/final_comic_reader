import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../models/products.dart';
import 'body_daily_screen.dart';
class DailyComic extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(

            isScrollable: true,
            indicatorColor: Colors.black,
            indicatorWeight: 2,
            labelColor: Colors.grey,
            tabs: <Widget>[
              Tab(child: Container(child: Text("MON",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("TUE",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("WED",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("THU",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("FRI",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("SAT",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("SUN",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("COMPLETED",style: TextStyle(color: Colors.grey,fontSize: 10),),),),

            ],
          ),

        ),
        body: TabBarView(
          children: [
            DailyBody(),
            DailyBody(),
            DailyBody(),
            DailyBody(),
            DailyBody(),
            DailyBody(),
            DailyBody(),
            DailyBody(),

          ],
        ),
      ),
    );
  }

  Widget buildPage(String text) => Center(
    child: Text(
      text,
      style: TextStyle(fontSize: 28),
    ),
  );
}
