import 'package:final_comic_reader/view/home_screen/components/bottom_navigator.dart';
import 'package:flutter/material.dart';
import '../for_you_screen/for_you_screen.dart';
import '../category_screen/category_screen.dart';
import '../canvas_screen/canvas_screen.dart';
import '../my_screen/my_screen.dart';
import '../more_screen/more_screen.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/homepage';
  String? message; // for SnackBar display if there is one

  HomeScreen({Key? key, this.message}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();

  int currentTabIndex = 0;

  List<Widget> tabs = [
    ForYouScreen(),
    CategoryScreen(),

    MyScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // if (widget.message != null) {
    //   print('if trueeee');
    //   WidgetsBinding.instance?.addPostFrameCallback((_) {
    //     print('bindinggggg');
    //     SnackBar snackBar = SnackBar(content: Text(widget.message!));
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   });
    // }

    return Scaffold(
      key: homeKey,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigator(
          currentIndex: currentTabIndex, onPress: _onItemTapped),
      body: tabs[currentTabIndex],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }
}
