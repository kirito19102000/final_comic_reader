import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/products.dart';
import '../../details_screen/detail_screen.dart';

class SeriesScrollViewComic extends StatefulWidget {
  const SeriesScrollViewComic(
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
    return _SeriesViewComic();
  }
}

class _SeriesViewComic extends State<SeriesScrollViewComic> {
  bool _cun = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      width: 150,
      padding: const EdgeInsets.only(top: 5, bottom: 2, left: 4),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.9, color: Colors.grey.shade400),

          ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.idcomic?.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {});

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    idimg: widget.idcomic?[index].toString() ?? "0",
                    Emty: widget.Emty[int.parse(widget.idcomic![index])],
                  ),
                ),
              );
            },
            child: Container(
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 140.0,
                      color: Colors.green,
                      child: Image.network(
                        widget.imgURL[int.parse(widget.idcomic![index])],
                        fit: BoxFit.fitWidth,
                        height: 120,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: Text(
                        widget.Name[int.parse(widget.idcomic![index])],
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 26,
                    margin: const EdgeInsets.all(5),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        side:
                            BorderSide(width: 0.9, color: Colors.grey.shade400),
                      ),
                      onPressed: () {
                        print("Click on Subscribed Button"); // no need
                      },
                      child: Text(
                        "✓ Subscribed",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  subscribeButton() {
    return Container(
      alignment: Alignment.center,
      height: 26,
      margin: const EdgeInsets.all(5),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side: BorderSide(width: 0.5, color: Colors.grey.shade200),
        ),
        onPressed: () {
          print("Click on Subscribed Button"); // no need
        },
        child: const Text(
          "✓ Subscribed",
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
