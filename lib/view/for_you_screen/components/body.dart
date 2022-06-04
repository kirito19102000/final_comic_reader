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
import '../../home_screen/home_screen.dart';
import 'search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_comic_reader/models/custom_user.dart';
import 'package:final_comic_reader/shared/firebase_authentication.dart';

final _db =  FirebaseDatabase.instance.reference();



class MyBody extends StatefulWidget {
  @override

  MyBodyState createState() {
   return MyBodyState();}

}

class MyBodyState extends State<MyBody> {
  List<String> imgUrl = [
  ];
  List<String> tagComic=[];
  List<String> nameComic=[];
  List<String> subAthu=[];
  List<bool> hasChapter=[];
  int numComicDb=17;
  int cot=0;


  String abc="test";


  int _currentIndex = 0;
  int count=0;

  late String uid;

  // late String username;
  late FirebaseAuth auth;
  late FirebaseAuthentication _authentication;
  late DatabaseReference ref;


  late String username;
  late List<String> comicList;



  @override
  void initState() {
    Firebase.initializeApp().whenComplete(() async {
      _authentication = FirebaseAuthentication();
      setState(() {});
    });

    super.initState();
  }
  CustomUser user = CustomUser(id: '0', name: 'Anonymous');
  Widget build(BuildContext context) {

    auth = FirebaseAuth.instance;
    ref = FirebaseDatabase.instance.reference();
    uid = auth.currentUser?.uid ?? '0';

    _db.child('Users/' + uid).onValue.listen((event) {
      Map<String?, dynamic> userJson =
      Map<String?, dynamic>.from(event.snapshot.value);
      username = userJson['name'] ?? 'Anonymous';
      if (userJson['subscribedComics'] == null) {
        comicList = [];
      } else {
        comicList = List.of(userJson['subscribedComics'].cast<String>());
      }
      CustomUser currentUser = CustomUser(id: uid, name: username);
      currentUser.subscribedComics = comicList;
      user = currentUser;
    });




    Size size = MediaQuery.of(context).size;
    _db.child('Comic').onValue.listen((event) {
      List <Object?> listComic=event.snapshot.value;
      numComicDb=listComic.length;
      setState(() {
      });

    });

    if (imgUrl.length<numComicDb.toInt()){
      for (var i = 0; i < numComicDb.toInt(); i++) {
        _db.child('Comic/'+i.toString()+'/Image').onValue.listen((event) {
          final String des=event.snapshot.value;
          imgUrl.add(des);


        });
      }
    }
    if (tagComic.length<numComicDb){
      for (var i = 0; i < numComicDb; i++) {
        _db.child('Comic/'+i.toString()+'/Category/0').onValue.listen((event) {
          final String des=event.snapshot.value;
          tagComic.add(des);

        });
      }
    }

    if (nameComic.length<numComicDb){
      for (var i = 0; i < numComicDb; i++) {
        _db.child('Comic/'+i.toString()+'/Name').onValue.listen((event) {
          final String des=event.snapshot.value;
          nameComic.add(des);


        });
      }
    }

    if (hasChapter.length<numComicDb){
      for (var i = 0; i < numComicDb; i++) {
        _db.child('Comic/'+i.toString()+'/Chapters').onValue.listen((event) {
          final bool des=event.snapshot.value==null;
          hasChapter.add(des);

        });
      }
    }




    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[


          ComicCarousel(numComic: 10,hasChapter: hasChapter,Name: nameComic,imgURL: imgUrl,),



          const Padding(padding: EdgeInsets.only(top: 10)),
          TitleWithMoreBtn(
            text: "My Series",
            press: () {},
          ),
          SeriesScrollViewComic(idcomic: user.subscribedComics?.toList(),Name: nameComic,Emty: hasChapter,imgURL: imgUrl,),
          const Padding(padding: EdgeInsets.only(top: 10)),

          TitleWithMoreBtn(
            text: "Comic",
            press: () {},
          ),
          DailyComicGridView(
            imgURL: imgUrl,tag: tagComic,name: nameComic,
            itemNum: 17,Emty: hasChapter,
          ),



          //ElevatedButton(onPressed: (){


          //_db.child('Comic/0/Chapters/0/Links').onValue.listen((event) {
          //final testall=Map<dynamic, dynamic>.from(event.snapshot.value);
          //List<Object?> testall=event.snapshot.value;
          //setState(() {
          //print(testall.length);

          //});


           // });

          //}, child: Text("up")),




          const AlignText(
            title: "Genres",
            size: 15,
          ),
          const GemresWidget(),
          Container(
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),


          TitleWithMoreBtn(
            text: "Setting",
            press: () {},
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

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const DetailScreen(idimg: "0",Emty: false,),),
                  );
                },
              ),
              const Spacer(),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.black,
                  size: 40,
                ),

                onPressed: () {},
              ),
              const Spacer(),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Colors.black,
                  size: 40,
                ),

                onPressed: () {},
              ),
              const Spacer(),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.youtube,
                  color: Colors.black,
                  size: 40,
                ),

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
                "Share WEBTOON",
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
