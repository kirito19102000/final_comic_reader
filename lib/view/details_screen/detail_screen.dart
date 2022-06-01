import 'dart:async';
import 'package:final_comic_reader/view/details_screen/components/chapter_list.dart';
import 'package:final_comic_reader/view/details_screen/components/detail_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class DetailScreen extends StatefulWidget implements PreferredSizeWidget {
  final String idimg;
  // implements: is to fix the error when Scaffold.appBar calls this class
  const DetailScreen({required this.idimg ,Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DetailState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _DetailState extends State<DetailScreen> {

  final _db =FirebaseDatabase.instance.reference();
  String imgurl="https://cdn-amz.fadoglobal.io/images/I/81r1n+TfLSS.jpg";


  @override
  Widget build(BuildContext context) {
    _db.child('Comic/'+widget.idimg+'/Image').onValue.listen((event) {
      String des=event.snapshot.value;
      setState(() {
        imgurl=des;
      });

    });
    return Scaffold(
      body: CustomScrollView(
        slivers: [
           DetailAppBar(
              backgroundImage:
                 imgurl),
          ChapterList(idComic: widget.idimg,)
        ],
      ),
    );
  }
}
