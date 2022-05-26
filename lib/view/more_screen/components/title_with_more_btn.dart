import 'package:flutter/material.dart';
import "dart:math" show pi;
import '../../../models/products.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 0,
      ),
      color: Colors.white,
      child: new InkWell(
        onTap: () {
          print("tapwww");
        },
        child: Row(
          children: <Widget>[
            CustomTextLine(text:text),
          ],
        ),
      ),
    );
  }
}

class CustomTextLine extends StatelessWidget {
  const CustomTextLine({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(height: 30,
        child: Align(
          alignment: Alignment.topLeft,
          child:Stack(
            children: <Widget>[
              Text(text,
                style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold) ,),
            ],
          ),)
    );
  }
}