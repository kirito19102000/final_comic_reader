import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';

class SpotlightComicGridView extends StatelessWidget {
  const SpotlightComicGridView({
    Key? key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child:  GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 5,crossAxisSpacing: 5,childAspectRatio: 2/3),
        itemBuilder: (context,index){
          return SpotlightComicView(index: index,tag: products[index].tag,title: products[index].title,view: products[index].view,);
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

class SpotlightComicView extends StatelessWidget {
  const SpotlightComicView({
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
                                text: products[index].title+"\n",
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 10),
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