import 'dart:async';
import 'package:flutter/material.dart';
import 'components/body.dart';

class DetailScreen extends StatefulWidget implements PreferredSizeWidget {
  // implements: is to fix the error when Scaffold.appBar calls this class
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DetailState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _DetailState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
