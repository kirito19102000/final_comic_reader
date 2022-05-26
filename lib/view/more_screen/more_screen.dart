import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'components/body.dart';

class MoreScreen extends StatefulWidget implements PreferredSizeWidget {
  // implements: is to fix the error when Scaffold.appBar calls this class
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MoreState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _MoreState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.white,
          leadingWidth: 1000,
          title: Text("More",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        ),

      body: Body(),
      );
  }

}