import 'package:flutter/material.dart';
import "dart:math" show pi;

class TitleWithMoreBtn extends StatelessWidget {
  final String text;
  final Function press;

  const TitleWithMoreBtn({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          print("title row container tapped");
        },
        child: Row(
          children: <Widget>[
            customTitle(text),
            const Spacer(),
            const Icon(
              Icons.navigate_next,
              color: Colors.black,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  customTitle(String text) {
    return SizedBox(
      height: 30,
      child: Align(
        alignment: Alignment.topLeft,
        child: Stack(
          children: <Widget>[
            Text(
              text,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
