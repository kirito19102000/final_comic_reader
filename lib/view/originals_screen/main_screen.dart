import 'package:flutter/material.dart';
import 'components/daily_screen.dart';
import 'components/genres_screen.dart';

class OriginalScreen extends StatefulWidget implements PreferredSizeWidget {
  // implements: is to fix the error when Scaffold.appBar calls this class
  const OriginalScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OriginalState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _OriginalState extends State<OriginalScreen> {
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
              Tab(text: 'Daily'),
              Tab(text: 'Genres'),

            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.assessment_sharp ),
              color: Colors.black,
              onPressed: () {},
            ),
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
            DailyComic(),
            GenresComic(),
          ],
        ),
      ),
    );
  }

}
