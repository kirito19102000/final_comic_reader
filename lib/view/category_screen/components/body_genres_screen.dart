import 'package:final_comic_reader/view/category_screen/components/comic_grid_view.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';
import 'genres_views.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

final _db =FirebaseDatabase.instance.reference();



class GenresBody extends StatefulWidget {
  String Tagcomic;
  GenresBody({required this.Tagcomic,Key? key}): super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GenresBody();
  }


}

class _GenresBody extends State<GenresBody>{
  int count=0;
  List<int> ComicWithTag=[];
  List<String> imgUrl = [];
  List<String> nameComic=[];
  List<bool> hasChapter=[];
  int numComicDb=17;

  @override
  Widget build(BuildContext context) {


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
    if (count<numComicDb){
      for (var i = 0; i < numComicDb; i++) {
        _db.child('Comic/'+i.toString()+'/Category').onValue.listen((event) {
          final List<Object?> des=event.snapshot.value;
          if(des.contains(widget.Tagcomic)){
            ComicWithTag.add(i);
          }
        });
        count++;
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




    if (nameComic.length<numComicDb){
      for (var i = 0; i < numComicDb; i++) {
        _db.child('Comic/'+i.toString()+'/Name').onValue.listen((event) {
          final String des=event.snapshot.value;
          nameComic.add(des);
        });
      }
    }


    // TODO: implement build
    return  Container(
      color: Colors.white,

      child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 20)),

            ComicGridView(itemNum: 10,idTagComic: ComicWithTag,imgUrl: imgUrl,nameComic: nameComic,Emty: hasChapter,)

          ]
      ),
    );
  }

}

