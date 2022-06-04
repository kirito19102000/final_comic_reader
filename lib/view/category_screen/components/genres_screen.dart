import 'package:flutter/material.dart';
import 'body_genres_screen.dart';

class GenresComic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 13,
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
              Tab(child: Container(child: Text("Action",style: TextStyle(color: Colors.grey,fontSize: 12),),),),
              Tab(child: Container(child: Text("Adventure",style: TextStyle(color: Colors.grey,fontSize: 12),),),),
              Tab(child: Container(child: Text("Supernatural",style: TextStyle(color: Colors.grey,fontSize: 12),),),),
              Tab(child: Container(child: Text("Fantasy",style: TextStyle(color: Colors.grey,fontSize: 12),),),),
              Tab(child: Container(child: Text("Drama",style: TextStyle(color: Colors.grey,fontSize: 12),),),),
              Tab(child: Container(child: Text("Comedy",style: TextStyle(color: Colors.grey,fontSize: 12),),),),
              Tab(child: Container(child: Text("Shounen",style: TextStyle(color: Colors.grey,fontSize: 12),),),),
              Tab(child: Container(child: Text("Slice Of Life",style: TextStyle(color: Colors.grey,fontSize: 12),),),),
              Tab(child: Container(child: Text("School Life",style: TextStyle(color: Colors.grey,fontSize: 12),),),),
              Tab(child: Container(child: Text("RomanceL",style: TextStyle(color: Colors.grey,fontSize: 12),),),),
              Tab(child: Container(child: Text("Tragedy",style: TextStyle(color: Colors.grey,fontSize: 12),),),),
              Tab(child: Container(child: Text("Historical",style: TextStyle(color: Colors.grey,fontSize: 12),),),),
              Tab(child: Container(child: Text("Martial Arts",style: TextStyle(color: Colors.grey,fontSize: 102),),),),

            ],
          ),

        ),
        body: TabBarView(
          children: [
            GenresBody(Tagcomic: "Action",),
            GenresBody(Tagcomic: "Adventure",),
            GenresBody(Tagcomic: "Supernatural",),
            GenresBody(Tagcomic: "Fantasy",),
            GenresBody(Tagcomic: "Drama",),
            GenresBody(Tagcomic: "Comedy",),
            GenresBody(Tagcomic: "Shounen",),
            GenresBody(Tagcomic: "Slice Of Life",),
            GenresBody(Tagcomic: "School Life",),
            GenresBody(Tagcomic: "Romance",),
            GenresBody(Tagcomic: "Tragedy",),
            GenresBody(Tagcomic: "Historical",),
            GenresBody(Tagcomic: "Martial Arts",),
          ],
        ),
      ),
    );
  }

}
