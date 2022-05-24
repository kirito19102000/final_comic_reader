import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';
import '../../details_screen/main_screen.dart';

class SeriesScrollViewComic extends StatelessWidget {
  const SeriesScrollViewComic({
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
          SeriesViewComic(
            size: size,
            imageUrl:products[0].imageURL,
            title: products[5].title,
            tag: products[0].tag,
            press: (){},
            csize: 0.28,
          ),
          SeriesViewComic(
            size: size,
            imageUrl:products[1].imageURL,
            title: products[1].title,
            tag: products[1].tag,
            press: (){},
            csize: 0.28,
          ),
          SeriesViewComic(
            size: size,
            imageUrl:products[2].imageURL,
            title: products[2].title,
            tag: products[2].tag,
            press: (){},
            csize: 0.28,
          ),
          SeriesViewComic(
            size: size,
            imageUrl:products[3].imageURL,
            title: products[3].title,
            tag: products[3].tag,
            press: (){},
            csize: 0.28,
          ),
          SeriesViewComic(
            size: size,
            imageUrl:products[4].imageURL,
            title: products[4].title,
            tag: products[4].tag,
            press: (){},
            csize: 0.28,
          ),
          SeriesViewComic(
            size: size,
            imageUrl:products[5].imageURL,
            title: products[5].title,
            tag: products[5].tag,
            press: (){},
            csize: 0.28,
          ),




        ],
      ),
    );
  }
}


class SeriesViewComic extends StatelessWidget {
  const SeriesViewComic({
    Key? key,
    required this.size,
    required this.imageUrl,
    required this.title,
    required this.tag,
    required this.press,
    required this.csize

  }) : super(key: key);
  final String imageUrl,title,tag;
  final Function press;

  final Size size;

  final double csize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailsScreen()),
        );
      },
      child:Container(
        margin: EdgeInsets.only(
          right: kDefaultPadding,
        ),
        color: Colors.white,
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
                              text: tag+"\n",
                              style: TextStyle(color: Colors.grey,fontSize: 10),
                            ),
                            TextSpan(
                              text: title+"\n",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 10),
                            ),
                          ]
                      )
                  )
                ],
              ),
            ),
            new Center(

              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  side: BorderSide(width: 1.5, color: Colors.grey),
                ),
                onPressed: () {
                  print("Click event on Container");
                },

                child: Text("✓ Subscribed",
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              ),)



          ],
        ),
      ),
    );
  }
}