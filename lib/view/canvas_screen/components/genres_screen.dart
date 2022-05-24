import 'package:flutter/material.dart';
import 'body_genres_screen.dart';

class GenresComic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 24,
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
              Tab(child: Container(child: Text("ALL",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("COMEDY",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("fANTASY",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("ROMANCE",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("SLICE OF LIFE",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("SCI-FI",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("DRAMA",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("SHORT STORY",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("ACTION",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("SUPERHERO",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("HEART-WARMIN",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("THRILLER",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("HORROR",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("POST-APOCALYPTIC",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("ZOMBIES",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("SCHOOL",style: TextStyle(color: Colors.grey,fontSize: 10),),),),

              Tab(child: Container(child: Text("SUPERNATURAL",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("ANIMALS",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("CRIME/MYSTERY",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("HISTORICAL",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("IMFORMATIVE",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("SPORTS",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("INSPINATIONAL",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("ALL AGES",style: TextStyle(color: Colors.grey,fontSize: 10),),),),






            ],
          ),

        ),
        body: TabBarView(
          children: [
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),
            GenresBody(),

          ],
        ),
      ),
    );
  }

}
