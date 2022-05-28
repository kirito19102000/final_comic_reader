import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<String>image=new List.empty(growable: true);


  @override
  Widget build(BuildContext context) {
    image.add("https://cdn.pixabay.com/photo/2017/02/27/19/57/marriage-2104147_1280.jpg");
    image.add("https://www.shaadidukaan.com/vogue/wp-content/uploads/2019/08/hug-kiss-images.jpg");
    image.add("https://images.pexels.com/photos/1133957/pexels-photo-1133957.jpeg");
    image.add("https://www.filmibeat.com/ph-big/2019/10/beautiful_157061627750.jpg");
    image.add("https://images.pexels.com/photos/1133957/pexels-photo-1133957.jpeg");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Scaffold(
        backgroundColor: Colors.white,
        appBar:  AppBar(
          title:  Text('Search'),
        ),
        body:  GestureDetector(
          behavior: HitTestBehavior.opaque,
          onPanDown: (detail) {
            print(detail);
            FocusScope.of(context).requestFocus( FocusNode());
          },
          child:  ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(height: 20.0),
              Card(elevation:4,child: Image.network("https://www.shaadidukaan.com/vogue/wp-content/uploads/2019/08/hug-kiss-images.jpg",fit: BoxFit.fitWidth,height: 150,)),

              Container(
                child:  GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: image.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 5,crossAxisSpacing: 5),
                  itemBuilder: (context,index){
                    return  Card(
                      elevation: 5,
                      child: Image.network(image[index],fit: BoxFit.fitWidth,height: 100),
                    );
                  },

                  scrollDirection: Axis.vertical,
                ),
              ),
              Card(elevation:4,child: Image.network("https://numeralpaint.com/wp-content/uploads/2020/05/c25-1.jpg",fit: BoxFit.fitWidth,height: 180,)),
              SizedBox(height: 20.0),
              Container(
                height: 100,
                child:  ListView.builder(


                  shrinkWrap: true,
                  itemCount: 5,

                  itemBuilder: (context,index){
                    return  Card(
                      elevation: 5,
                      child: Container(
                        height: 50.0,
                        color: Colors.green,
                        child:  Image.network("https://www.shaadidukaan.com/vogue/wp-content/uploads/2019/08/hug-kiss-images.jpg",fit: BoxFit.fitWidth,height: 120,),

                      ),
                    );
                  },

                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 20.0),
              Card(elevation:4,child: Image.network("https://numeralpaint.com/wp-content/uploads/2020/05/c25-1.jpg",fit: BoxFit.fitWidth,height: 180,)),

            ],
          ),
        ),
      ),
    );
  }
}