import 'package:final_comic_reader/models/custom_user.dart';
import 'package:final_comic_reader/shared/firebase_authentication.dart';
import 'package:final_comic_reader/view/details_screen/components/chapter_list.dart';
import 'package:final_comic_reader/view/details_screen/components/detail_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

final _db = FirebaseDatabase.instance.reference();

class DetailScreen extends StatefulWidget // implements PreferredSizeWidget
{
  final String idimg;
  final bool Emty;

  // implements: is to fix the error when Scaffold.appBar calls this class
  const DetailScreen({required this.idimg, required this.Emty, Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DetailState();
  }

// @override
// Size get preferredSize => const Size.fromHeight(100);
}

class _DetailState extends State<DetailScreen> {
  late String uid;

  // late String username;
  late FirebaseAuth auth;
  late FirebaseAuthentication _authentication;
  late DatabaseReference ref;

  String imgurl = "https://cdn-amz.fadoglobal.io/images/I/81r1n+TfLSS.jpg";
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

  @override
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

    _db.child('Comic/' + widget.idimg + '/Image').onValue.listen((event) {
      String des = event.snapshot.value;
      imgurl = des;
      // });
    });

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DetailAppBar(
            backgroundImage: imgurl,
            user: user,
            comicId: widget.idimg,
          ),
          ChapterList(
            idComic: widget.idimg,
            Emty: widget.Emty,
          ),
        ],
      ),
    );
  }
}
