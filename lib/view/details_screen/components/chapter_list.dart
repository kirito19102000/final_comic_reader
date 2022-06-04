import 'package:final_comic_reader/view/comic_screen/comic_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../models/products.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

final _db = FirebaseDatabase.instance.reference();

int count = 0;
int numChapter = 15;

class ChapterList extends StatefulWidget {
  String idComic;
  final bool Emty;

  ChapterList({Key? key, required this.idComic, required this.Emty})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    if (Emty) {
      return _EmtyChapterList();
    } else {
      return _ChapterList();
    }
  }
}

class _ChapterList extends State<ChapterList> {
  // final int chapterNumber;
  List<String>? names;
  List<String>? images;
  List<Object?> ListImg = [];
  String? NameChapter;
  bool? Emty;
  List<String> ChapterImg = [];
  List<String> ChapterName = [];

  @override
  Widget build(BuildContext context) {
    List<String> NameList = [];
    List<String> ImgList = [];

    _db
        .child('Comic/' + widget.idComic + '/Chapters')
        .onValue
        .listen((event) {
      List<Object?> listChapter = event.snapshot.value;
      numChapter = listChapter.length;
    });

    if (ChapterImg.length < numChapter) {
      for (var i = 0; i < numChapter; i++) {
        String test = "";
        _db
            .child('Comic/' +
            widget.idComic +
            '/Chapters/' +
            i.toString() +
            '/Links/0')
            .onValue
            .listen((event) {
          if (event.snapshot.value != null) {
            final String listChapter = event.snapshot.value;
            test = listChapter;
            ChapterImg.add(test);
          }
        });
      }
    }

    if (ChapterName.length < numChapter) {
      for (var i = 0; i < numChapter; i++) {
        _db
            .child('Comic/' +
            widget.idComic +
            '/Chapters/' +
            i.toString() +
            '/Name')
            .onValue
            .listen((event) {
          if (event.snapshot.value != null) {
            final String listChapter = event.snapshot.value;
            NameList.add(listChapter);
            ChapterName = NameList;
          }
        });
      }
    }



    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _db
                    .child('Comic/' +
                    widget.idComic +
                    '/Chapters/' +
                    index.toString() +
                    '/Links')
                    .onValue
                    .listen((event) {
                  List<Object?> listChapter = event.snapshot.value;
                  ListImg = listChapter;
                });
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ComicScreen(
                        images: ListImg,
                        NameChapter: ChapterName[index],
                      ),
                ),
              );
            },
            //products[index].imageURL
            // if images and names list are null default mock is generated
            child: chapterTile(index, ChapterImg[index], ChapterName[index]),
          );
        },
        childCount: numChapter, // 1000 list items:
      ),
    );
  }

  chapterTile(int number, String? image, String? name) {
    return Container(
      // color: Colors.blueGrey,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.2,
          ),
          top: BorderSide(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
      ),
      height: 100,
      alignment: Alignment.center,
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.only(left: 25)),
          chapterImage(image ??
              "https://upload.wikimedia.org/wikipedia/vi/c/c7/Naruto_Volume_1_manga_cover.jpg"),
          const Padding(padding: EdgeInsets.only(right: 20)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  name ?? 'Chapter Name',
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  softWrap: true,
                ),
              ),
              Text(
                "Ep. ${number + 1}",
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              )
            ],
          ),
          const Spacer(),
          Text(
            "#$number",
            style: const TextStyle(fontSize: 17, color: Colors.black),
          ),
          const Padding(padding: EdgeInsets.only(right: 25))
        ],
      ),
    );
  }

  chapterImage(String image) {
    return SizedBox(
      width: 80,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _EmtyChapterList extends State<ChapterList> {
  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          child: const Text(
            'Comming soon',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        );
      }, childCount: 1),
    );
  }
}
