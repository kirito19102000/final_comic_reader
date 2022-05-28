import 'package:flutter/material.dart';
import 'body_genres_screen.dart';

class GenresComic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 16,
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
              Tab(child: Container(child: Text("DRAMA",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("FANTASY",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("COMEDY",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("ACTION",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("SLICE OF LIFE",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("ROMANCE",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("FUPERHERO",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("SCI-FI",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("THRILLER",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("SUPERNATUNAL",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("MYSTERY",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("SPORTS",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("HISTORICAL",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("HEART-WARMING",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("HORROR",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("IMFORMATIVE",style: TextStyle(color: Colors.grey,fontSize: 10),),),),



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

          ],
        ),
      ),
    );
  }

}
