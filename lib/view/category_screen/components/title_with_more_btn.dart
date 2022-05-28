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
            Spacer(),
            Transform.rotate(
              angle: 180 * pi / 180,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios ,
                  color: Colors.black,
                  size: 15,
                ),
                onPressed: null,
              ),
            ),
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
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold) ,),
            ],
          ),)
    );
  }
}