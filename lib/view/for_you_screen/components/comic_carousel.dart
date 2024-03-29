import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import '../../details_screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'search_screen.dart';

class ComicCarousel extends StatefulWidget {
  ComicCarousel(
      {required this.Name,
      required this.hasChapter,
      required this.numComic,
      required this.imgURL,
      Key? key})
      : super(key: key);
  List<bool> hasChapter;
  List<String> Name, imgURL;

  int numComic;

  @override
  State<StatefulWidget> createState() {
    return _ComicCarouselState();
  }
}

final _db = FirebaseDatabase.instance.reference();

class _ComicCarouselState extends State<ComicCarousel> {
  int _currentIndex = 0;
  late int numComicDb;
  late int randomId;
  bool Emty = false;

  List<int> idComic = [];

  int count = 0;
  List<String> imgUrl = [];

  @override
  Widget build(BuildContext context) {
    _db.child('Comic').onValue.listen((event) {
      List<Object?> listComic = event.snapshot.value;
      numComicDb = listComic.length;
    });

    while (idComic.length < widget.numComic) {
      randomId = Random().nextInt(17);
      if (idComic.contains(randomId) == false) {
        idComic.add(randomId);
      }
    }

    if (imgUrl.length < widget.numComic) {
      for (var i = 0; i < idComic.length; i++) {
        _db
            .child('Comic/' + idComic[i].toString() + '/Image')
            .onValue
            .listen((event) {
          final String des = event.snapshot.value;
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
              enlargeCenterPage: true,
              autoPlay: true,
              onPageChanged: (index, other) async {
                setState(() {
                  _currentIndex = index;
                });
                _db
                    .child('Comic/' +
                        idComic[_currentIndex].toString() +
                        '/Chapters')
                    .onValue
                    .listen((event) {
                  final bool des = event.snapshot.value == null;
                  Emty = des;
                });
              },
            ),
            items: imgUrl.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    // margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: GestureDetector(
                      child: Image.network(image, fit: BoxFit.fill),
                      onTap: () {
                        setState(() {});
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // get comic id and detail screen receives id
                            builder: (context) => DetailScreen(
                              idimg: idComic[_currentIndex].toString(),
                              Emty: Emty,
                            ),
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
              child: Container(
                margin: const EdgeInsets.only(right: 10, top: 7),
                // padding: const EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(spreadRadius: 0.1, blurRadius: 0.5)],
                ),
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 28,
                  ),
                  tooltip: 'Search',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // get comic id and detail screen receives id
                        builder: (context) => SearchScreen(
                          imgURL: widget.imgURL,
                          NameComic: widget.Name,
                          Emty: widget.hasChapter,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 2.0,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.only(right: 10, bottom: 5),
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, right: 10, left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(spreadRadius: 0.1, blurRadius: 0.5)
                  ],
                ),
                child: Text(
                  (_currentIndex + 1).toString() +
                      '/' +
                      widget.numComic.toString(),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
