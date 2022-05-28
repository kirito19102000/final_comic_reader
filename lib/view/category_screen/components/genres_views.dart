import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';

class GenresGridView extends StatelessWidget {
  const GenresGridView({
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 5,crossAxisSpacing: 2,childAspectRatio: 6),
        itemBuilder: (context,index){
          return GenresComicView (imgURL: products[index].imageURL,title: products[index].title,view: products[index].view,description: products[index].description,);
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

class GenresComicView extends StatelessWidget {
  const GenresComicView ({
    Key? key,
    required this.description,
    required this.title,
    required this.imgURL,
    required this.view
  }) : super(key: key);
  final String imgURL,title,description;
  final int view;

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
                              style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 15),
                            ),
                            TextSpan(
                              text: "♥ "+view.toString()+"\n",
                              style: TextStyle(color: Colors.green,fontSize: 10),
                            ),
                            TextSpan(
                              text:  description+"\n",
                              style: TextStyle(color: Colors.grey,fontSize: 10),
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