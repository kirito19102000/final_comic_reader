import 'package:flutter/material.dart';
import 'components/body.dart';

class ForYouScreen extends StatefulWidget implements PreferredSizeWidget {
  // implements: is to fix the error when Scaffold.appBar calls this class
  const ForYouScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ForYouState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _ForYouState extends State<ForYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: MyBody(),
    );
  }
}
