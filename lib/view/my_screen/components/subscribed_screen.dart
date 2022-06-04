import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../details_screen/detail_screen.dart';

class SubscribedComicGridView extends StatefulWidget {
  const SubscribedComicGridView(
      {Key? key,
      required this.Emty,
      required this.Name,
      required this.idcomic,
      required this.imgURL})
      : super(key: key);
  final List<String> Name, imgURL;
  final List<bool> Emty;
  final List<String>? idcomic;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SubscribedComicGridView();
  }
}

class _SubscribedComicGridView extends State<SubscribedComicGridView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.idcomic?.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 5,
            crossAxisSpacing: 2,
            childAspectRatio: 6),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      idimg: widget.idcomic?[index].toString() ?? "0",
                      Emty: widget.Emty[int.parse(widget.idcomic![index])],
                    ),
                  ),
                );
              });
            },
            child: Container(
              child: Row(
                children: [
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 140.0,
                      width: 80,
                      color: Colors.green,
                      child: Image.network(
                        widget.imgURL[int.parse(widget.idcomic![index])],
                        fit: BoxFit.fitWidth,
                        height: 120,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(left: 13.0),
                      child: Text(
                        widget.Name[int.parse(widget.idcomic![index])],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
