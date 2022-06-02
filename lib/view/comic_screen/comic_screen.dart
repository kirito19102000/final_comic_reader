import 'package:final_comic_reader/view/comic_screen/components/comic_app_bar.dart';
import 'package:flutter/material.dart';

class ComicScreen extends StatefulWidget {
  final List<Object?>? images;
  final String NameChapter;

  const ComicScreen({Key? key,required this.images,required this.NameChapter}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ComicScreenState();
  }
}

class _ComicScreenState extends State<ComicScreen> {
  bool _showAppBar = true;

  @override
  Widget build(BuildContext context) {
    List<Object?> images = widget.images ?? [];
    if (widget.images?.length == 0) {
      // if there is none or empty images data, mock with this
      images = [
        'http://tintruyen.net/12279/fix-8/6.jpg?gf=hdfgdfg',
        'http://tintruyen.net/12279/fix-8/6.jpg?gf=hdfgdfg',
        'http://tintruyen.net/12279/fix-8/6.jpg?gf=hdfgdfg'
      ];
    }

    return Scaffold(
      appBar: _showAppBar ? ComicAppBar(name: widget.NameChapter,) : null,
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
