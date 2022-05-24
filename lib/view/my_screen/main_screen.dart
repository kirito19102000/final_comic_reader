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
          title: Text("My Series",style: TextStyle(color: Colors.black),),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.black,
            labelColor: Colors.grey,
            tabs: [
              Tab(child: Container(child: Text("RECENT",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("SUBSCRIBED",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("DOWNLOADS",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("UNLOCKED",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("CREATORS",style: TextStyle(color: Colors.grey,fontSize: 10),),),),
              Tab(child: Container(child: Text("COMMENTS",style: TextStyle(color: Colors.grey,fontSize: 10),),),),



            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_downward),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.black,
              onPressed: () {},
            ),

            IconButton(
              icon: Icon(Icons.currency_exchange),
              color: Colors.black,
              onPressed: () {},
            )
          ],
          //backgroundColor: Colors.purple,


        ),
        body: TabBarView(

          children: [
            RecentComicGridView(itemNum: 3,),
            SubscribedComicGridView(itemNum: 3),
            DownloadComicGridView(itemNum: 1),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Unlock your favarite stories with Fast\nPass or Daily Pass!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                )
            ),
            Container(

              child: Column(children: [
                Container(margin: EdgeInsets.all(kDefaultPadding/2),),
                Row(children: [Text("Suggested for you ",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)],),

                Container(margin: EdgeInsets.all(kDefaultPadding/4),),
                CreatorsComicGridView(itemNum: 1)
              ],),
            )
            ,
            Align(
                alignment: Alignment.center,
                child: Text(
                  "You haven't posted any comments yet",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                )
            ),
          ],
        ),
      ),
    );
  }

}
