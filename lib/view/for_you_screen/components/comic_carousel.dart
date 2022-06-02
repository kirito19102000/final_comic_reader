import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_comic_reader/view/details_screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ComicCarousel extends StatefulWidget {

  int numComic;


  ComicCarousel({required this.numComic, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return _ComicCarouselState();
  }
}
final _db =FirebaseDatabase.instance.reference();


class _ComicCarouselState extends State<ComicCarousel> {

  int _currentIndex = 0;
  late int numComicDb;
  late int randomId;

  List <int> idComic=[];


  int count=0;
  List<String> imgUrl = [
  ];

  @override
  Widget build(BuildContext context) {

    _db.child('Comic').onValue.listen((event) {
      List <Object?> listComic=event.snapshot.value;
      numComicDb=listComic.length;
    });


    while (idComic.length<widget.numComic){
      randomId=Random().nextInt(17);
      if(idComic.contains(randomId)==false){
        idComic.add(randomId);
      }
    }

    if (imgUrl.length<widget.numComic){
      for (var i = 0; i < idComic.length; i++) {
        _db.child('Comic/'+i.toString()+'/Image').onValue.listen((event) {
          final String des=event.snapshot.value;
          imgUrl.add(des);
        });
      }
    }

    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlayInterval: const Duration(seconds: 3),
              enableInfiniteScroll: true,
              aspectRatio: 2.0,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: true,
              onPageChanged: (index,other) async{
                setState(() {
                  _currentIndex=index;
                });
              },
              // onPageChanged: (index, other) async {
              //   // _currentIndex = index;
              //   // print(_currentIndex);
              //   // setState(() {});
              // },
            ),
            items: imgUrl.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: GestureDetector(
                      child: Image.network(image, fit: BoxFit.fill),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // TODO correct linking to each detail page
                            // get comic id and detail screen receives id
                            builder: (context) => DetailScreen(idimg: _currentIndex.toString()),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }).toList(),
          ),
          AspectRatio(
            aspectRatio: 2.0,
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Search',
                onPressed: () {},
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 2.0,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text((_currentIndex+1).toString()+'/'+widget.numComic.toString(),style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),
    );
  }

}
