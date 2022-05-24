import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';

import 'genres_comic_grid_view.dart';

class GenresBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  Container(
      color: Colors.white,

      child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  Text("dats"),
                  Spacer(),
                  Text("data")
                ],
              ),
            ),
            GenresComicGridView(itemNum: products.length)
            
          ]
      ),
    );
  }
}

