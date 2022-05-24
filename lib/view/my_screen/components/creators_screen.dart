import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';

class CreatorsComicGridView extends StatelessWidget {
  const CreatorsComicGridView({
    Key? key,
    required this.itemNum,
  }) : super(key: key);
  final int itemNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemNum,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 5,crossAxisSpacing: 2,childAspectRatio: 6),
        itemBuilder: (context,index){
          return CreatorsComicView(imgURL: products[index].imageURL,title: products[index].title,creators: products[index].creators,lastup: products[index].lastup,);
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

class CreatorsComicView extends StatelessWidget {
  const CreatorsComicView({
    Key? key,
    required this.creators,
    required this.title,
    required this.imgURL,
    required this.lastup
  }) : super(key: key);
  final String imgURL,title,creators,lastup;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("on tap");
      },
      child: Container(
        child: Row(
          children: [
            Container(width: 100,
              child: Image.network(imgURL),),
            Container(
              margin: EdgeInsets.only(left: kDefaultPadding
              ),
              child: Column(
                children: [
                  RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: creators+"\n",
                              style: TextStyle(color: Colors.black,fontSize: 15),
                            ),
                            TextSpan(
                              text: "Creator of "+title+"\n",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 10),
                            ),
                            TextSpan(
                              text: lastup+"\n",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 10),
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