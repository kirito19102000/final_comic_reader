import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'title_with_more_btn.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        children: [


          Container(
            height: 100,

            margin: EdgeInsets.only(left: kDefaultPadding/2,
            right: kDefaultPadding/2),
            child: Row(
              children: [
                Column(
                  children: [
                    Text("💲 0\nPurchased 0     Free 0")
                  ],
                ),
                Spacer(),
                TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent)),
                  onPressed: () {},
                  child: const Text('Buy Coins',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
      Container(
        margin: EdgeInsets.only(left: kDefaultPadding*2,right: kDefaultPadding*2),
        child: Row(children: [
        GestureDetector(
          onTap: (){
            print("on tap");
          },
          child: Column(
            children: [
              Icon(Icons.search,color: Colors.black,size: 40,),
              Text("Search",)

            ],
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: (){
            print("on tap");
          },
          child: Column(
            children: [
              Icon(Icons.settings,color: Colors.black,size: 40,),
              Text("Settings",)

            ],
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: (){
            print("on tap");
          },
          child: Column(
            children: [
              Icon(Icons.change_circle,color: Colors.black,size: 40,),
              Text("Fan Translation",)

            ],
          ),
        ),

      ],),),
          Container(margin: EdgeInsets.all(kDefaultPadding/2),),
          Container(margin: EdgeInsets.only(left: kDefaultPadding),
            child: Row(children: [
              TitleWithMoreBtn(text: "Notice  > ", press: (){}),
              TitleWithMoreBtn(text: " mxmxtoon't Brass & Sass Music Video", press: (){})
            ],))

        ],
      ),
    );
  }
}