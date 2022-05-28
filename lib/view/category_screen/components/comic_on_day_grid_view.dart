import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';

class ComicGridView extends StatelessWidget {
  const ComicGridView({
    Key? key,
    required this.itemNum
  }) : super(key: key);
  final int itemNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemNum,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 5,crossAxisSpacing: 5,childAspectRatio: 2/3),
        itemBuilder: (context,index){
          return DayComicRecomend(index: index,tag: products[index].tag,title: products[index].title,view: products[index].view,imgURL: products[index].imageURL,);
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

class DayComicRecomend extends StatelessWidget {
  const DayComicRecomend({
    Key? key,
    required this.tag,
    required this.title,
    required this.view,
    required this.index,
    required this.imgURL
  }) : super(key: key);
  final int index,view;
  final String tag,title,imgURL;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("Click event on Container");
        },
        child:Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.network(imgURL,fit: BoxFit.fitWidth,height: 100),
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
                                text: title+"\n\n",
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 10),
                              ),

                              TextSpan(
                                text: "♥ "+view.toString(),
                                style: TextStyle(color: Colors.green,fontSize: 10),
                              ),
                            ]
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}