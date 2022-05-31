import 'package:final_comic_reader/view/home_screen/home_screen.dart';
import 'package:final_comic_reader/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }

}
