import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';

class UnlockComicFreeRecommendGridView extends StatelessWidget {
  const UnlockComicFreeRecommendGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 5,crossAxisSpacing: 2,childAspectRatio: 6),
        itemBuilder: (context,index){
          return UnlockComicFreeRecommend(imgURL: products[index].imageURL,title: products[index].title,tag: products[index].tag,);
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

class UnlockComicFreeRecommend extends StatelessWidget {
  const UnlockComicFreeRecommend({
    Key? key,
    required this.tag,
    required this.title,
    required this.imgURL
  }) : super(key: key);
  final String imgURL,title,tag;

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
                              text: title+"\n",
                              style: TextStyle(color: Colors.black,fontSize: 15),
                            ),
                            TextSpan(
                              text: tag+"\n\n",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 10),
                            ),
                          ]
                      )
                  )
                ],
              ),)

          ],
        ),
      ),
    );
  }
}