import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants.dart';
import '../../../models/products.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.green,
          expandedHeight: 200,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(background: Image.network("https://cdn-amz.fadoglobal.io/images/I/81r1n+TfLSS.jpg",fit: BoxFit.cover,),),
          actions: [
            Row(children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.checkCircle,
                  color: Colors.white,
                  size: 20,
                ),
                tooltip: 'Action',
                onPressed: () {},
              ),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.exclamationCircle,
                  color: Colors.white,
                  size: 20,
                ),
                tooltip: 'Action',
                onPressed: () {},
              ),

              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.arrowCircleDown,
                  color: Colors.white,
                  size: 20,
                ),
                tooltip: 'Action',
                onPressed: () {},
              ),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.shareAlt,
                  color: Colors.white,
                  size: 20,
                ),
                tooltip: 'Action',
                onPressed: () {},
              ),
            ],)

          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return GestureDetector(onTap: (){print("tapss");},
                child: Container(
                  color: Colors.blueGrey,
                  height: 80,
                  alignment: Alignment.center,
                  child: Row(children: [
                    Container(width: 50,
                      child: Image.network(products[index].imageURL,fit: BoxFit.cover,),),
                    Column(children: [
                      Text(
                        "chapter name",
                        style: const TextStyle(fontSize: 15,color: Colors.white),
                      ),
                      Text(
                        "chapter $index",
                        style: const TextStyle(fontSize: 10),
                      )
                    ],),
                    Spacer(),
                    Text(
                      "# $index",
                      style: const TextStyle(fontSize: 15,color: Colors.white),
                    ),
                  ],),
                ));
            },
            childCount: 10,// 1000 list items
          ),
        )

      ],
    );
  }
}
