import 'package:flutter/material.dart';
import 'home_page_screen/home_page_screen.dart';
import 'category_screen/category_screen.dart';
import 'canvas_screen/canvas_screen.dart';
import 'my_screen/my_screen.dart';
import 'more_screen/more_screen.dart';

class HomepageScreen extends StatefulWidget {
  static const route = '/homepage';

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomepageScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    ForYouScreen(),
    CategoryScreen(),
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
        body: tabs[currentTabIndex],
      ),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'HOME PAGE',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: 'CATEGORY',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_stories_outlined),
          label: 'CANVAS',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
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
