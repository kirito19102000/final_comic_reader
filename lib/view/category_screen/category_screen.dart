import 'package:flutter/material.dart';
import 'components/genres_screen.dart';

class CategoryScreen extends StatefulWidget implements PreferredSizeWidget {
  // implements: is to fix the error when Scaffold.appBar calls this class
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CategoryState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _CategoryState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,

        //backgroundColor: Colors.purple,
      ),
      body: GenresComic(),
    );
  }
}
