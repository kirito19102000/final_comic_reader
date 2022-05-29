import 'package:flutter/material.dart';

class ComicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? name;
  const ComicAppBar({Key? key, this.name}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title(name ?? 'Received Chapter Name'),
      backgroundColor: Colors.black.withOpacity(0.5),
      // elevation: 2,
    );
  }

  title(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 17),
    );
  }

  // return SliverAppBar(
  // title: chapterName(name ?? 'Received Chapter Name'),
  // backgroundColor: Colors.black.withOpacity(0.5),
  // floating: true,
  // // elevation: 2,
  // );

}
