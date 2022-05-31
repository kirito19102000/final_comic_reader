import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';
import '../../details_screen/detail_screen.dart';

class ScrollViewRecomedComic extends StatelessWidget {
  const ScrollViewRecomedComic({
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
          RecomendComic(
            size: size,
            imageUrl:'https://cdn-amz.fadoglobal.io/images/I/81r1n+TfLSS.jpg',
            title: "One Push_Man",
            view: '65M',
            deription: 'test derition',
            press: (){},
            csize: 0.7,
          ),
          RecomendComic(
            size: size,
            imageUrl:'https://cdn-amz.fadoglobal.io/images/I/81r1n+TfLSS.jpg',
            title: "One Push_Man",
            view: '65M',
            deription: 'test derition',
            press: (){},
            csize: 0.7,
          ),
          RecomendComic(
            size: size,
            imageUrl:'https://cdn-amz.fadoglobal.io/images/I/81r1n+TfLSS.jpg',
            title: "One Push_Man",
            view: '65M',
            deription: 'test derition',
            press: (){},
            csize: 0.7,
          ),
          RecomendComic(
            size: size,
            imageUrl:'https://cdn-amz.fadoglobal.io/images/I/81r1n+TfLSS.jpg',
            title: "One Push_Man",
            view: '65M',
            deription: 'test derition',
            press: (){},
            csize: 0.7,
          ),
          RecomendComic(
            size: size,
            imageUrl:'https://cdn-amz.fadoglobal.io/images/I/81r1n+TfLSS.jpg',
            title: "One Push_Man",
            view: '65M',
            deription: 'test derition',
            press: (){},
            csize: 0.7,
          ),
          RecomendComic(
            size: size,
            imageUrl:'https://cdn-amz.fadoglobal.io/images/I/81r1n+TfLSS.jpg',
            title: "One Push_Man",
            view: '65M',
            deription: 'test derition',
            press: (){},
            csize: 0.7,
          ),


        ],
      ),
    );
  }
}


class RecomendComic extends StatelessWidget {
  const RecomendComic({
    Key? key,
    required this.size,
    required this.imageUrl,
    required this.title,
    required this.view,
    required this.deription,
    required this.press,
    required this.csize

  }) : super(key: key);
  final String imageUrl,title,view,deription;
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
      child:Container(
        margin: EdgeInsets.only(

          right: kDefaultPadding,


        ),
        color: Colors.white,
        width: size.width * csize,
        height: size.height*0.3,
        child: Column(
          children: <Widget>[
            Image.network(
              imageUrl,
              height: 200,
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
                              text: title+"\t\t\t\t\t\t\t\t\t\t\t\t",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 10),
                            ),
                            TextSpan(
                              text: "♥ "+view+"\n",
                              style: TextStyle(color: Colors.green,fontSize: 10),
                            ),
                            TextSpan(
                              text: deription,
                              style: TextStyle(color: Colors.grey,fontSize: 10),
                            ),
                          ]
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}