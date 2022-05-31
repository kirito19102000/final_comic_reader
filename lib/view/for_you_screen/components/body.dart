import 'comic_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../models/products.dart';
import 'my_series.dart';
import 'daily_comic.dart';
import 'title_with_more_btn.dart';
import '../../../constants.dart';
import 'new_comic_originals_recomend.dart';
import 'scroll_view_comic.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';
import '../../details_screen/detail_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';


class MyBody extends StatefulWidget {
  @override
  MyBodyState createState() => MyBodyState();
}







class MyBodyState extends State<MyBody> {


  String abc="test";

  final _db =FirebaseDatabase.instance.reference();


  int _currentIndex = 0;
  int count=0;



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    List<String> imgUrl = [
    ];

    for (var i = 0; i < 10; i++) {
      _db.child('Comic/'+i.toString()+'/Image').onValue.listen((event) {
        final String des=event.snapshot.value;
        imgUrl.add(des);
      });
    }


    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[

          ComicCarousel(images: imgUrl,numComic: 10,),


          const Padding(padding: EdgeInsets.only(top: 10)),
          TitleWithMoreBtn(
            text: "My Series",
            press: () {},
          ),



          SeriesScrollViewComic(size: size),
          const Padding(padding: EdgeInsets.only(top: 10)),
          TitleWithMoreBtn(
            text: "New WEBTOON ORIGINALS",
            press: () {},
          ),

          //ElevatedButton(onPressed: (){


            //_db.child('Comic/0/Chapters').onValue.listen((event) {
             // List<Object?> allO=event.snapshot.value;
              //setState(() {
               // print(allO.length);

             // });

          //  });

        //  }, child: Text("up")),

          //ElevatedButton(onPressed: (){


            //_db.child('Comic/0/Chapters/0/Links').onValue.listen((event) {
              //final testall=Map<dynamic, dynamic>.from(event.snapshot.value);
              //List<Object?> testall=event.snapshot.value;
              //setState(() {
                //print(testall.length);

              //});

           // });

          //}, child: Text("up")),

          ScrollViewRecomedNewComic(size: size),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),

          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          TitleWithMoreBtn(
            text: "Top Completed Series",
            press: () {},
          ),
          ScrollViewComic(size: size),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          TitleWithMoreBtn(
            text: "Top Series",
            press: () {},
          ),
          Container(
            height: 400,
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    aspectRatio: 1,
                    enlargeCenterPage: false,
                    autoPlay: false,
                    onPageChanged: (index, other) {
                      setState(() {
                        _currentIndex = index;
                        print(_currentIndex);
                      });
                    },
                  ),
                  items: imgUrl.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 2,
                                    childAspectRatio: 6),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DetailScreen(idimg: "0"),),
                                  );
                                },
                                child: Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        index.toString(),
                                        style: const TextStyle(
                                            color: Colors.green, fontSize: 20),
                                      ),
                                      Card(
                                        elevation: 4,
                                        child: Image.network(
                                          products[index].imageURL,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            products[index].title,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              products[index].tag,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            scrollDirection: Axis.vertical,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          TitleWithMoreBtn(
            text: "All Time Favorties ",
            press: () {},
          ),
          Container(
            height: 250,
            child: Column(
              children: [
                Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        aspectRatio: 18 / 8,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        onPageChanged: (index, other) {
                          _currentIndex = index;
                          setState(() {});
                        },
                      ),
                      items: imgUrl.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: GestureDetector(
                                    child: Image.network(i, fit: BoxFit.fill),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DetailScreen(idimg: "0"),),
                                      );
                                    }));
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "\t\tdata",
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding),
          ),
          const TextGestureDetector(
            toptext: "Exiciting Stories on CANVS",
            bottomtext: "Series from out Self-Publishing Creators",
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          const AlignText(
            title: "Staff Picks",
            size: 15,
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 4),
          ),
          ScrollViewComic(size: size),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          const AlignText(
            title: "Hidden Gems",
            size: 15,
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 4),
          ),
          ScrollViewComic(size: size),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          const AlignText(
            title: "Today's Hot Series",
            size: 15,
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 4),
          ),
          ScrollViewComic(size: size),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          const AlignText(
            title: "Romance",
            size: 15,
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 4),
          ),
          ScrollViewComic(size: size),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          const AlignText(
            title: "Rising Stars",
            size: 15,
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 4),
          ),
          ScrollViewComic(size: size),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          const AlignText(
            title: "Drama",
            size: 15,
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 4),
          ),
          ScrollViewComic(size: size),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          const AlignText(
            title: "Comedy/Slice-of-Life",
            size: 15,
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 4),
          ),
          ScrollViewComic(size: size),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          const AlignText(
            title: "Epic Adventures",
            size: 15,
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 4),
          ),
          ScrollViewComic(size: size),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          const AlignText(
            title: "Spotlight",
            size: 15,
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 4),
          ),
          ScrollViewComic(size: size),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          const AlignText(
            title: "Binge-worthy Series",
            size: 15,
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 4),
          ),
          ScrollViewComic(size: size),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          TitleWithMoreBtn(
            text: "Daily",
            press: () {},
          ),
          const DailyComicGridView(
            itemNum: 9,
          ),
          const AlignText(
            title: "Genres",
            size: 15,
          ),
          const GemresWidget(),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          const Text(
            "Find your series",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 4),
          ),
          GestureDetector(
            onTap: () {
              print("Click event on Container");
            },
            child: Card(
                elevation: 2,
                child: Image.network(
                  "https://photo.techrum.vn/images/2022/01/02/doremon-remake-TECHRUM-cover966645bc9366d3aa.jpg",
                  fit: BoxFit.fitWidth,
                  height: 60,
                )),
          ),
          const AlignText(title: "Looking for something dangeruos?", size: 15),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 4),
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          TitleWithMoreBtn(
            text: "Daily",
            press: () {},
          ),
          TitleWithMoreBtn(
            text: "Ranking",
            press: () {},
          ),
          TitleWithMoreBtn(
            text: "Genres",
            press: () {},
          ),
          TitleWithMoreBtn(
            text: "Fan Translation",
            press: () {},
          ),
          TitleWithMoreBtn(
            text: "Setting",
            press: () {},
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "__________________________________________________________",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          TitleWithMoreBtn(
            text: "Notice",
            press: () {},
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "asdadasd",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          Container(
              child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.facebook,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Search',
                onPressed: () {},
              ),
              const Spacer(),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Search',
                onPressed: () {},
              ),
              const Spacer(),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Search',
                onPressed: () {},
              ),
              const Spacer(),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.youtube,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Search',
                onPressed: () {},
              ),
            ],
          )),
          new Center(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: const BorderSide(width: 1.5, color: Colors.grey),
              ),
              onPressed: () {
                print("Click event on Container");
              },
              child: const Text(
                "Sahre WEBTOON",
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GemresWidget extends StatelessWidget {
  const GemresWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.masksTheater,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Drama',
                onPressed: () {},
              ),
              const Text("Drama")
            ],
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.hatWizard,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Fantasy"',
                onPressed: () {},
              ),
              const Text("Fantasy")
            ],
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.smile,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Comedy',
                onPressed: () {},
              ),
              const Text("Comedy")
            ],
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.crosshairs,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Action',
                onPressed: () {},
              ),
              const Text("Action")
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class TextGestureDetector extends StatelessWidget {
  const TextGestureDetector(
      {Key? key, required this.bottomtext, required this.toptext})
      : super(key: key);
  final String toptext, bottomtext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Click event on Container");
      },
      child: Container(
        margin: const EdgeInsets.only(
          right: kDefaultPadding,
        ),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: toptext + "\n",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: bottomtext,
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlignText extends StatelessWidget {
  const AlignText({Key? key, required this.title, required this.size})
      : super(key: key);
  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
      ),
    );
  }
}
