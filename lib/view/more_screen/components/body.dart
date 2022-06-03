import 'package:final_comic_reader/shared/firebase_authentication.dart';
import 'package:final_comic_reader/view/login_screen/login_screen.dart';
import 'package:final_comic_reader/view/more_screen/components/icon_button_group.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MoreBodyState();
  }
}

class _MoreBodyState extends State<Body> {
  late String uid;
  late String username;
  late FirebaseAuth auth;
  late FirebaseAuthentication _authentication;
  late DatabaseReference ref;

  @override
  void initState() {
    Firebase.initializeApp().whenComplete(() async {
      _authentication = FirebaseAuthentication();
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    auth = FirebaseAuth.instance;
    ref = FirebaseDatabase.instance.reference();
    uid = auth.currentUser?.uid ?? '';

    return FutureBuilder(
        future: getUsername(uid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            username = snapshot.data as String;
          } else {
            username = 'Anonymous';
          }

          return Container(
            color: Colors.white,
            child: Column(
              // shrinkWrap: true,
              children: [
                Container(
                  height: 100,
                  color: Colors.black26,
                  margin: const EdgeInsets.only(bottom: 20),
                  // height: 200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              username,
                              style: const TextStyle(fontSize: 20),
                              softWrap: true,
                              textAlign: TextAlign.start,
                            ),
                            Text(username == 'Anonymous'
                                ? 'Not logged in'
                                : 'Logged in'),
                          ],
                        ),
                      ),
                      const Spacer(),
                      dynamicButton(context),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                      )
                    ],
                  ),
                ),
                operationsRow(),
              ],
            ),
          );
        });
  }

  dynamicButton(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
      ),
      onPressed: () {
        if (username == 'Anonymous') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        } else {
          setState(() {
            username = 'Anonymous';
          });
          _authentication.logout();
        }
      },
      child: Text(
        username == 'Anonymous' ? 'Login' : 'Logout',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  operationsRow() {
    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
      ),
      child: Row(
        children: const [
          IconButtonGroup(
            name: 'Search',
            icon: Icons.search,
          ),
          Spacer(),
          IconButtonGroup(
            name: 'Settings',
            icon: Icons.settings,
          ),
          Spacer(),
          IconButtonGroup(
            name: 'Fan Translation',
            icon: Icons.change_circle,
          ),
        ],
      ),
    );
  }

  Future<String> getUsername(String uid) async {
    final snapshot = await ref.child('Users/$uid').get();
    if (snapshot != null) {
      return snapshot.value['name'];
    } else {
      return 'Anonymous';
    }
  }
}

// Container(
//   margin: EdgeInsets.only(left: kDefaultPadding),
//   child: Row(
//     children: [
//       TitleWithMoreBtn(text: "Notice  > ", press: () {}),
//       TitleWithMoreBtn(
//           text: " mxmxtoon't Brass & Sass Music Video", press: () {})
//     ],
//   ),
// )
