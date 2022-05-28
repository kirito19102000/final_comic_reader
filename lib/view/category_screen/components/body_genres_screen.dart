import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/products.dart';
import 'genres_views.dart';

class GenresBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  Container(
      color: Colors.white,

      child: ListView(
          shrinkWrap: true,
          children: <Widget>[

            GenresGridView(itemNum: products.length)
            
          ]
      ),
    );
  }
}

