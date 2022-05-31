import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/products.dart';
import '../../details_screen/detail_screen.dart';

class SeriesScrollViewComic extends StatelessWidget {
  const SeriesScrollViewComic({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SeriesViewComic(
            size: size,
            imageUrl: products[0].imageURL,
            title: products[5].title,
            tag: products[0].tag,
            press: () {},
            csize: 0.28,
          ),
          SeriesViewComic(
            size: size,
            imageUrl: products[1].imageURL,
            title: products[1].title,
            tag: products[1].tag,
            press: () {},
            csize: 0.28,
          ),
          SeriesViewComic(
            size: size,
            imageUrl: products[2].imageURL,
            title: products[2].title,
            tag: products[2].tag,
            press: () {},
            csize: 0.28,
          ),
          SeriesViewComic(
            size: size,
            imageUrl: products[3].imageURL,
            title: products[3].title,
            tag: products[3].tag,
            press: () {},
            csize: 0.28,
          ),
          SeriesViewComic(
            size: size,
            imageUrl: products[4].imageURL,
            title: products[4].title,
            tag: products[4].tag,
            press: () {},
            csize: 0.28,
          ),
          SeriesViewComic(
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

class SeriesViewComic extends StatelessWidget {
  const SeriesViewComic(
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailScreen(idimg: "0"),),
        );
      },
      child: Container(
        width: 120,
        // height: 250,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 0.5, color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 100,
              child: Image.network(
                imageUrl,
                height: double.infinity,
                width: double.infinity,
                // fit: BoxFit.fitWidth,
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Text(
                tag,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 10),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            subscribeButton(),
          ],
        ),
      ),
    );
  }

  subscribeButton() {
    return Container(
      alignment: Alignment.center,
      height: 26,
      margin: const EdgeInsets.all(5),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side: BorderSide(width: 0.5, color: Colors.grey.shade200),
        ),
        onPressed: () {
          print("Click on Subscribed Button"); // no need
        },
        child: const Text(
          "✓ Subscribed",
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
