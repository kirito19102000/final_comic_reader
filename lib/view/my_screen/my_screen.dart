import 'package:flutter/material.dart';
import 'components/recent_screen.dart';
import 'components/subscribed_screen.dart';
import 'components/downloads_screen.dart';
import 'components/creators_screen.dart';
import '../../../constants.dart';

class MyScreen extends StatefulWidget implements PreferredSizeWidget {
  // implements: is to fix the error when Scaffold.appBar calls this class
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _MyState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 1000,
          title: const Text(
            "My Series",
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.black,
            labelColor: Colors.grey,
            tabs: [
              Tab(
                child: Container(
                  child: const Text(
                    "RECENT",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: const Text(
                    "SUBSCRIBED",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: const Text(
                    "DOWNLOADS",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: const Text(
                    "UNLOCKED",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: const Text(
                    "CREATORS",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: const Text(
                    "COMMENTS",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_downward),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.currency_exchange),
              color: Colors.black,
              onPressed: () {},
            )
          ],
          //backgroundColor: Colors.purple,
        ),
        body: TabBarView(
          children: [
            const RecentComicGridView(
              itemNum: 3,
            ),
            const SubscribedComicGridView(itemNum: 3),
            const DownloadComicGridView(itemNum: 1),
            const Align(
                alignment: Alignment.center,
                child: Text(
                  'Unlock your favarite stories with Fast\nPass or Daily Pass!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                )),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(kDefaultPadding / 2),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Suggested for you ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(kDefaultPadding / 4),
                  ),
                  const CreatorsComicGridView(itemNum: 1)
                ],
              ),
            ),
            const Align(
                alignment: Alignment.center,
                child: Text(
                  "You haven't posted any comments yet",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                )),
          ],
        ),
      ),
    );
  }
}
