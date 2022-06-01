import 'package:final_comic_reader/view/comic_screen/comic_screen.dart';
import 'package:flutter/material.dart';
import '../../../models/products.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
final _db =FirebaseDatabase.instance.reference();

List <String> ChapterName=[];
List <String> ChapterImg=[];
int count=0;
int numChapter=15;

class ChapterList extends StatelessWidget {
  // final int chapterNumber;
  List<String>? names;
  List<String>? images;
  String idComic;




  ChapterList({Key? key, required this.idComic}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    _db.child('Comic/'+idComic+'/Chapters').onValue.listen((event) {
      List <Object?> listChapter=event.snapshot.value;
        numChapter=listChapter.length;

    });

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                print(numChapter);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ComicScreen(
                            images: [],
                          )),
                );
              },
              //products[index].imageURL
              // if images and names list are null default mock is generated
              child: chapterTile(index, images?[index], names?[index]));
        },
        childCount: numChapter, // 1000 list items
      ),
    );
  }

  chapterTile(int number, String? image, String? name) {
    return Container(
      color: Colors.blueGrey,
      height: 80,
      alignment: Alignment.center,
      child: Row(
        children: [
          chapterImage(image ??
              "https://upload.wikimedia.org/wikipedia/vi/c/c7/Naruto_Volume_1_manga_cover.jpg"),
          Column(
            children: [
              Text(
                name ?? 'The Chapter Name',
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
              Text(
                "Chapter $number",
                style: const TextStyle(fontSize: 10),
              )
            ],
          ),
          const Spacer(),
          Text(
            "#$number",
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
        ],
      ),
    );
  }

  chapterImage(String image) {
    return SizedBox(
      width: 50,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
