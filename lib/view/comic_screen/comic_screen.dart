import 'package:final_comic_reader/view/comic_screen/components/comic_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';



List<Object?> images = [
];
int numImg=15;
List <Object?> ThisChapterImg=[];

class ComicScreen extends StatefulWidget {

  final String idChapter;
  final String idComic;

  ComicScreen({Key? key, required this.idChapter,required this.idComic}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ComicScreenState();
  }
}

class _ComicScreenState extends State<ComicScreen> {
  bool _showAppBar = true;
  final _db =FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    List <Object?>  ImgList=[];

    _db.child('Comic/'+widget.idComic+'/Chapters/'+widget.idChapter+'/Links').onValue.listen((event) {
      List listChapter=event.snapshot.value;
      images=listChapter;

    });


    return Scaffold(
      appBar: _showAppBar ? ComicAppBar() : null,
      body: GestureDetector(
        onTap: () => setState(() {
          _showAppBar = !_showAppBar;
        }),
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(images[index].toString());
          },
        ),
      ),
    );


    // return Scaffold(
    //   body: CustomScrollView(
    //     slivers: [
    //       const ComicAppBar(
    //         name: 'Doraemon vol1.1',
    //       ),
    //       SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //           (BuildContext context, int index) {
    //             return GestureDetector(
    //               onTap: () => setState(() {
    //                 _showAppBar = !_showAppBar;
    //               }),
    //               child: ListView.builder(
    //                 padding: const EdgeInsets.all(10),
    //                 itemCount: images.length,
    //                 itemBuilder: (BuildContext context, int index) {
    //                   return Image.network(images[index]);
    //                 },
    //               ),
    //             );
    //           },
    //           childCount: images.length,
    //         ),
    //       ),
    //     ],
    //   ),
    // );

  }
}
