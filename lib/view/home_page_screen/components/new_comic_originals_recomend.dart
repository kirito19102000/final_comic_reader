import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';
import '../../details_screen/detail_screen.dart';

class ScrollViewRecomedNewComic extends StatelessWidget {
  const ScrollViewRecomedNewComic({
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
          RecomendNewComic(
            size: size,
            imageUrl:products[0].imageURL,
            press: (){},
            csize: 0.28,
          ),
          RecomendNewComic(
            size: size,
            imageUrl:products[1].imageURL,
            press: (){},
            csize: 0.28,
          ),
          RecomendNewComic(
            size: size,
            imageUrl:products[2].imageURL,
            press: (){},
            csize: 0.28,
          ),
          RecomendNewComic(
            size: size,
            imageUrl:products[3].imageURL,
            press: (){},
            csize: 0.28,
          ),
          RecomendNewComic(
            size: size,
            imageUrl:products[4].imageURL,
            press: (){},
            csize: 0.28,
          ),
          RecomendNewComic(
            size: size,
            imageUrl:products[5].imageURL,
            press: (){},
            csize: 0.28,
          ),




        ],
      ),
    );
  }
}


class RecomendNewComic extends StatelessWidget {
  const RecomendNewComic({
    Key? key,
    required this.size,
    required this.imageUrl,
    required this.press,
    required this.csize

  }) : super(key: key);
  final String imageUrl;
  final Function press;

  final Size size;

  final double csize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailScreen()),
        );
      },
      child:Container(
        margin: EdgeInsets.only(
          right: kDefaultPadding,
        ),
        color: Colors.white,
        width: size.width * csize,
        height: size.height*0.26,
        child: Column(
          children: <Widget>[
            Image.network(
              imageUrl,
              height: 200,
            ),

          ],
        ),
      ),
    );
  }
}