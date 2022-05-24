import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';

class GenresComicGridView extends StatelessWidget {
  const GenresComicGridView({
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
          return GenresComicView(index: index,tag: products[index].tag,title: products[index].title,view: products[index].view,);
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

class GenresComicView extends StatelessWidget {
  const GenresComicView({
    Key? key,
    required this.tag,
    required this.title,
    required this.view,
    required this.index
  }) : super(key: key);
  final int index,view;
  final String tag,title;

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
              Image.network(products[index].imageURL,fit: BoxFit.fitWidth,height: 100),
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
                                text: products[index].tag+"\n",
                                style: TextStyle(color: Colors.grey,fontSize: 10),
                              ),
                              TextSpan(
                                text: products[index].title+"\n\n",
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 10),
                              ),

                              TextSpan(
                                text: "♥ "+products[index].view.toString(),
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