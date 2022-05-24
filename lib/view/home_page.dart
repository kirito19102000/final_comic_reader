import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'for_you_screen/main_screen.dart';
import 'originals_screen/main_screen.dart';
import 'canvas_screen/main_screen.dart';
import 'my_screen/main_screen.dart';
import 'more_creen/main_creen.dart';

class HomepageScreen extends StatefulWidget {
  static const route= '/homepage';
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }

}

class HomeScreenState extends State<HomepageScreen> {

  int currentTabIndex =0;
  List<Widget> tabs = [
    ForYouScreen(),
    OriginalScreen(),
    CanvasScreen(),
    MyScreen(),
    MoreScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

            backgroundColor: Colors.white,
            bottomNavigationBar: bottomNavigationBar(),
            body: tabs[currentTabIndex]
        )
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'FOR YOU',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: 'ORIGINALS',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'CANVAS',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_stories_outlined ),
          label: 'MY',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.keyboard_control),
          label: 'MORE',

        ),
      ],
      currentIndex: currentTabIndex,
      selectedItemColor: Colors.green,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }



}
