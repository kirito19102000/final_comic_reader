import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';
import '../../details_screen/detail_screen.dart';

class ComicGridView extends StatelessWidget {
  const ComicGridView({
    Key? key,
    required this.Emty,
    required this.nameComic,
    required this.imgUrl,
    required this.idTagComic,
    required this.itemNum
  }) : super(key: key);
  final int itemNum;
  final List<int> idTagComic;
  final List<String> nameComic,imgUrl;
  final List<bool> Emty;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: idTagComic.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 5,crossAxisSpacing: 5,childAspectRatio: 2/3),
        itemBuilder: (context,index){
          return GestureDetector(
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                     DetailScreen(idimg: idTagComic[index].toString(),Emty: Emty[idTagComic[index]],),),
                );
              },
              child:Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Image.network(imgUrl[idTagComic[index]],fit: BoxFit.fitWidth,height: 100),
                    Flexible(
                      child: new Container(
                        padding: new EdgeInsets.only(right: 13.0),
                        child: new Text(
                          nameComic[idTagComic[index]],
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            fontSize: 13.0,
                            fontFamily: 'Roboto',
                            color: new Color(0xFF212121),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

