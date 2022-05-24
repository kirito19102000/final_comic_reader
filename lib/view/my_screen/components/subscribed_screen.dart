import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SubscribedComicGridView extends StatelessWidget {
  const SubscribedComicGridView({
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
          return SubscribedComicView(imgURL: products[index].imageURL,title: products[index].title,creators: products[index].creators,lastup: products[index].lastup,);
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

class SubscribedComicView extends StatelessWidget {
  const SubscribedComicView({
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
                              text: title+"\n",
                              style: TextStyle(color: Colors.black,fontSize: 15),
                            ),
                            TextSpan(
                              text: creators+"\n",
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
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: kDefaultPadding),
              child: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.bell,
                  color: Colors.green,
                  size: 30,
                ),
                tooltip: 'Search',
                onPressed: () {},
              ),)


          ],
        ),
      ),
    );
  }
}