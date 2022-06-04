import 'package:flutter/material.dart';
import 'components/recent_screen.dart';
import 'components/subscribed_screen.dart';
import 'components/downloads_screen.dart';
import 'components/creators_screen.dart';
import '../../../constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_comic_reader/models/custom_user.dart';
import 'package:final_comic_reader/shared/firebase_authentication.dart';

final _db =  FirebaseDatabase.instance.reference();

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
  List<String> imgUrl = [
  ];
  List<String> tagComic=[];
  List<String> nameComic=[];

  List<bool> hasChapter=[];
  int numComicDb=17;
  int cot=0;
  late String uid;

  // late String username;
  late FirebaseAuth auth;
  late FirebaseAuthentication _authentication;
  late DatabaseReference ref;


  late String username;
  late List<String> comicList;



  @override
  void initState() {
    Firebase.initializeApp().whenComplete(() async {
      _authentication = FirebaseAuthentication();
      setState(() {});
    });

    super.initState();
  }
  CustomUser user = CustomUser(id: '0', name: 'Anonymous');
  Widget build(BuildContext context) {

    auth = FirebaseAuth.instance;
    ref = FirebaseDatabase.instance.reference();
    uid = auth.currentUser?.uid ?? '0';

    _db.child('Users/' + uid).onValue.listen((event) {
      Map<String?, dynamic> userJson =
      Map<String?, dynamic>.from(event.snapshot.value);
      username = userJson['name'] ?? 'Anonymous';
      if (userJson['subscribedComics'] == null) {
        comicList = [];
      } else {
        comicList = List.of(userJson['subscribedComics'].cast<String>());
      }
      CustomUser currentUser = CustomUser(id: uid, name: username);
      currentUser.subscribedComics = comicList;
      user = currentUser;
    });


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
    if (tagComic.length<numComicDb){
      for (var i = 0; i < numComicDb; i++) {
        _db.child('Comic/'+i.toString()+'/Category/0').onValue.listen((event) {
          final String des=event.snapshot.value;
          tagComic.add(des);

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

    if (hasChapter.length<numComicDb){
      for (var i = 0; i < numComicDb; i++) {
        _db.child('Comic/'+i.toString()+'/Chapters').onValue.listen((event) {
          final bool des=event.snapshot.value==null;
          hasChapter.add(des);
        });
      }
    }

    return DefaultTabController(
      length: 5,
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
                    "SUBSCRIBED",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: const Text(
                    "DOWNLOADS",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: const Text(
                    "UNLOCKED",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: const Text(
                    "CREATORS",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: const Text(
                    "COMMENTS",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
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

            SubscribedComicGridView(Name: nameComic,Emty: hasChapter,idcomic: user.subscribedComics?.toList(),imgURL: imgUrl,),
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
