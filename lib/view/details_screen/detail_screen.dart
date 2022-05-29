import 'dart:async';
import 'package:final_comic_reader/view/details_screen/components/chapter_list.dart';
import 'package:final_comic_reader/view/details_screen/components/detail_app_bar.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget implements PreferredSizeWidget {
  // implements: is to fix the error when Scaffold.appBar calls this class
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DetailState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _DetailState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const DetailAppBar(
              backgroundImage:
                  "https://cdn-amz.fadoglobal.io/images/I/81r1n+TfLSS.jpg"),
          ChapterList()
        ],
      ),
    );
  }
}
