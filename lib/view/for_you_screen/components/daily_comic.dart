import 'package:flutter/material.dart';
import '../../details_screen/detail_screen.dart';
import 'package:firebase_database/firebase_database.dart';

final _db = FirebaseDatabase.instance.reference();
int _cun = 0;

class DailyComicGridView extends StatefulWidget {
  DailyComicGridView(
      {Key? key,
      required this.itemNum,
      required this.imgURL,
      required this.tag,
      required this.name,
      required this.Emty})
      : super(key: key);
  final int itemNum;
  final List<String> imgURL;
  final List<String> tag;
  final List<String> name;
  final List<bool> Emty;

  @override
  State<StatefulWidget> createState() {
    return _Daily();
  }
}

class _Daily extends State<DailyComicGridView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.itemNum,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 2 / 3),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      idimg: index.toString(),
                      Emty: widget.Emty[index],
                    ),
                  ),
                );
              },
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [

                    Image.network(widget.imgURL[index],
                        fit: BoxFit.fitWidth, height: 100),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.only(left: 27),
                        alignment: Alignment.centerLeft,
                        // padding: const EdgeInsets.only(right: 13.0),
                        child: Text(
                          widget.tag[index],
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Roboto',
                            color: Colors.grey,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        // padding: const EdgeInsets.only(right: 15.0),
                        // margin: const EdgeInsets.only(left:0),
                        child: Text(
                          widget.name[index],
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13.0,
                            fontFamily: 'Roboto',
                            color: Color(0xFF212121),
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
