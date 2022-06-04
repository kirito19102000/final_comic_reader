import 'package:final_comic_reader/models/custom_user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String backgroundImage;
  CustomUser user;
  final String comicId;

  DetailAppBar({
    Key? key,
    required this.backgroundImage,
    required this.user,
    required this.comicId,
  }) : super(
            key:
                key); // : preferredSize = Size.fromHeight(60.0), super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  State<StatefulWidget> createState() {
    return _DetailAppBarState();
  }
}

class _DetailAppBarState extends State<DetailAppBar> {
  late bool isSubscribed;
  late List<String> comicList;

  @override
  void initState() {
    comicList = widget.user.subscribedComics ?? [];
    widget.user.subscribedComics = comicList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    comicList = widget.user.subscribedComics ?? [];
    if (comicList.contains(widget.comicId)) {
      isSubscribed = true;
    } else {
      isSubscribed = false;
    }
    return SliverAppBar(
      backgroundColor: Colors.green,
      expandedHeight: 200,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          widget.backgroundImage,
          fit: BoxFit.cover,
        ),
      ),
      actions: [
        Row(
          children: [
            subscribeButton(),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.exclamationCircle,
                color: Colors.white,
                size: 25,
              ),
              tooltip: 'Action',
              onPressed: () {},
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.arrowCircleDown,
                color: Colors.white,
                size: 25,
              ),
              tooltip: 'Action',
              onPressed: () {},
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.shareAlt,
                color: Colors.white,
                size: 25,
              ),
              tooltip: 'Action',
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }

  subscribeButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSubscribed = !isSubscribed;
          userSubscribe(widget.user.id, widget.comicId);
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 13, bottom: 13),
        padding: const EdgeInsets.only(left: 7, right: 7),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Text(
            isSubscribed ? '✓ Subscribed' : '+ Subscribe',
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      ),
    );
  }

  userSubscribe(String userId, String comicId) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.reference().child("Users/" + userId);

    print(widget.user);
    if (comicList.contains(comicId)) {
      widget.user.unsubscribeComic(comicId);
    } else {
      if (widget.user.subscribedComics == null) {
        widget.user.subscribedComics = [];
      }
        widget.user.subscribeToComic(comicId);
    }
    await ref.set(widget.user.toJson());
  }
}
