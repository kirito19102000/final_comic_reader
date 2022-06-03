import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';
import '../../details_screen/detail_screen.dart';
import 'package:firebase_database/firebase_database.dart';

final _db =FirebaseDatabase.instance.reference();
int _cun=0;




class DailyComicGridView extends StatefulWidget {
  DailyComicGridView({
    Key? key,
    required this.itemNum,
    required this.imgURL,
    required this.tag,
    required this.name,
    required this.Emty
  }) : super(key: key);
  final int itemNum;
  final List <String> imgURL;
  final List <String> tag;
  final List <String> name;
  final List <bool> Emty;


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Daily();
  }
}

class _Daily extends State<DailyComicGridView>{
  @override
  Widget build(BuildContext context) {


    return Container(
      child:  GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.itemNum,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 5,crossAxisSpacing: 5,childAspectRatio: 2/3),
        itemBuilder: (context,index){
          return GestureDetector(
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  DetailScreen(idimg: index.toString(),Emty: widget.Emty[index],),),
                );
              },
              child:Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Image.network(widget.imgURL[index],fit: BoxFit.fitWidth,height: 100),
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
                                      text: widget.tag[index]+"\n",
                                      style: TextStyle(color: Colors.grey,fontSize: 10),
                                    ),
                                    TextSpan(
                                      text: widget.name[index]+"\n",
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
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }

}
