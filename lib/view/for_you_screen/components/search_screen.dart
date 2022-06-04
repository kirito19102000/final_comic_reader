import 'package:final_comic_reader/view/canvas_screen/components/spotlight_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../details_screen/detail_screen.dart';
import 'package:firebase_database/firebase_database.dart';

final _db = FirebaseDatabase.instance.reference();

class SearchScreen extends StatefulWidget {
  SearchScreen(
      {required this.Emty,
      required this.imgURL,
      required this.NameComic,
      Key? key})
      : super(key: key);
  final List<String> imgURL, NameComic;
  final List<bool> Emty;

  @override
  _SearchScreenState createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> Name = [
    'Doraemon',
    'Dragon Ball',
    'One Piece',
    'Fairy Tai',
    'One puch_man',
    'Bleach',
    'Conan',
    'Gintama',
    'Hunter X Hunter',
    'Naruto',
    'Nanatsu No Taizai',
    'Shokugeki No Soma',
    'Tsuyokute New Saga',
    'Ansatsu Kyoushitsu',
    'Uratarou',
    'Gan Kon',
    'Ore To Kawazu-San No Isekai Hourouki'
  ];
  List<int> ID = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16];

  TextEditingController? _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<int> idComic = [];

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 10)),
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "search comic",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue))),
            onChanged: (value) {
              setState(() {
                for (var i = 0; i < widget.NameComic.length; i++) {
                  if (widget.NameComic[i]
                      .toLowerCase()
                      .contains(value.toLowerCase())) {
                    idComic.add(i);
                  }
                }
                ID = idComic;
                idComic = [];
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ID.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    widget.imgURL[ID[index]],
                    fit: BoxFit.cover,
                  ),
                  minVerticalPadding: 2,
                  title: Text(widget.NameComic[ID[index]]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // get comic id and detail screen receives id
                        builder: (context) => DetailScreen(
                          idimg: ID[index].toString(),
                          Emty: widget.Emty[ID[index]],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
