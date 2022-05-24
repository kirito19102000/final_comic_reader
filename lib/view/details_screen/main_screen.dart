import 'dart:async';
import 'package:flutter/material.dart';
import 'components/body.dart';

class DetailsScreen extends StatefulWidget implements PreferredSizeWidget {
  // implements: is to fix the error when Scaffold.appBar calls this class
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DetailsState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _DetailsState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }

}
