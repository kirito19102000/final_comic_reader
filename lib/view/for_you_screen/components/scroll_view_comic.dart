import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';
import '../../details_screen/detail_screen.dart';

class ScrollViewComic extends StatelessWidget {
  const ScrollViewComic({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ViewComic(
            size: size,
            imageUrl: products[0].imageURL,
            title: products[5].title,
            tag: products[0].tag,
            press: () {},
            csize: 0.28,
          ),
          ViewComic(
            size: size,
            imageUrl: products[1].imageURL,
            title: products[1].title,
            tag: products[1].tag,
            press: () {},
            csize: 0.28,
          ),
          ViewComic(
            size: size,
            imageUrl: products[2].imageURL,
            title: products[2].title,
            tag: products[2].tag,
            press: () {},
            csize: 0.28,
          ),
          ViewComic(
            size: size,
            imageUrl: products[3].imageURL,
            title: products[3].title,
            tag: products[3].tag,
            press: () {},
            csize: 0.28,
          ),
          ViewComic(
            size: size,
            imageUrl: products[4].imageURL,
            title: products[4].title,
            tag: products[4].tag,
            press: () {},
            csize: 0.28,
          ),
          ViewComic(
            size: size,
            imageUrl: products[5].imageURL,
            title: products[5].title,
            tag: products[5].tag,
            press: () {},
            csize: 0.28,
          ),
        ],
      ),
    );
  }
}

class ViewComic extends StatelessWidget {
  const ViewComic(
      {Key? key,
      required this.size,
      required this.imageUrl,
      required this.title,
      required this.tag,
      required this.press,
      required this.csize})
      : super(key: key);
  final String imageUrl, title, tag;
  final Function press;
  final Size size;
  final double csize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: link to correct detail screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailScreen(idimg: "0",Emty: false,),),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          right: kDefaultPadding,
        ),
        color: Colors.white,
        width: size.width * csize,
        height: size.height * 0.18,
        child: Column(
          children: <Widget>[
            Image.network(
              imageUrl,
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: tag + "\n",
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        TextSpan(
                          text: title + "\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
