import 'package:final_comic_reader/view/canvas_screen/components/spotlight_screen.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'components/body.dart';

class MoreScreen extends StatefulWidget implements PreferredSizeWidget {
  // implements: is to fix the error when Scaffold.appBar calls this class
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MoreScreenState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 1000,
        centerTitle: false,
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: const Text(
            "More",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Body(),
    );
  }
}
