import 'package:flutter/material.dart';
import 'components/genres_screen.dart';
import 'components/spotlight_screen.dart';


class CanvasScreen extends StatefulWidget implements PreferredSizeWidget {
  // implements: is to fix the error when Scaffold.appBar calls this class
  const CanvasScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CanvasState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _CanvasState extends State<CanvasScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,

          leadingWidth: 1000,
          leading: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            labelColor: Colors.grey,
            tabs: [
              Tab(text: 'Spotlight'),
              Tab(text: 'Genres'),

            ],
          ),
          actions: [

            IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: () {},
            )
          ],
          //backgroundColor: Colors.purple,


        ),
        body: TabBarView(
          children: [
            SpotlightComic(),
            GenresComic(),
          ],
        ),
      ),
    );
  }

}
