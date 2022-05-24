import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants.dart';
import 'title_with_more_btn.dart';
import 'spotlight_comic_grid_view.dart';
import '../../../models/products.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SpotlightComic extends StatefulWidget {
  @override
  _SpotlightComic createState() => _SpotlightComic();

}

final List<String> imgUrl=[products[0].imageURL,
  products[1].imageURL,
  products[2].imageURL,
  products[3].imageURL,];

class _SpotlightComic extends State<SpotlightComic> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int _current =0;

    return  Container(
        color: Colors.white,
        child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(margin: EdgeInsets.all(kDefaultPadding/2),),
          AlignText(title: "Recommended Series", size: 18),
          Container(margin: EdgeInsets.all(kDefaultPadding/2),),

          GestureDetector(
            onTap: (){
              print("Click event on Container");
            },
            child: Card(elevation:2,child: Image.network("https://photo.techrum.vn/images/2022/01/02/doremon-remake-TECHRUM-cover966645bc9366d3aa.jpg",fit: BoxFit.fitWidth,height: 60,)),
          ),
          Container(margin: EdgeInsets.all(kDefaultPadding/2),),

          TitleWithMoreBtn(text: "Top Series",press: () {},),
          Container(height: 400,
            child: Stack(children: [
              CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  aspectRatio: 1,
                  enlargeCenterPage: false,
                  autoPlay: false,
                  onPageChanged: (index,other){
                    setState(() {
                      _current=index;
                      print( _current);
                    });
                  },
                ),
                items: imgUrl.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        child:  GridView.builder(
                          physics: NeverScrollableScrollPhysics(),


                          itemCount: 5,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 5,crossAxisSpacing: 2,childAspectRatio: 6),
                          itemBuilder: (context,index){
                            return GestureDetector(
                              onTap: (){
                                print("on tap");
                              },
                              child: Container(
                                child:Row(children: [
                                Text(index.toString(),style: TextStyle(color: Colors.green,fontSize: 20),),
                                Card(elevation: 4,child: Image.network(products[index].imageURL,fit: BoxFit.cover,),),
                                Column(children: [
                                  Text(products[index].title,style: TextStyle(color: Colors.black),),
                                  Align(alignment: Alignment.centerLeft,child: Text(products[index].tag,style: TextStyle(color: Colors.grey,fontSize: 10),),)
                                ],),

                              ],),),
                            );
                          },
                          scrollDirection: Axis.vertical,
                        ),
                      );
                    },
                  );
                }).toList(),

              ),

            ],),),

          AlignText(title: "Fresh Picks", size: 18),
          Container(margin: EdgeInsets.all(kDefaultPadding/2),),
          SpotlightComicGridView(),

          GestureDetector(
            onTap: (){
              print("Click event on Container");
            },
            child: Card(elevation:2,child: Image.network("https://photo.techrum.vn/images/2022/01/02/doremon-remake-TECHRUM-cover966645bc9366d3aa.jpg",fit: BoxFit.fitWidth,height: 60,)),
          ),
          Container(margin: EdgeInsets.all(kDefaultPadding/2),),

          TitleWithMoreBtn(text: "Gensres", press: (){}),
          Container(child:
          Row(children: [
            Column(children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.masksTheater,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Drama',
                onPressed: () {},
              ),
              Text("Drama")
            ],),
            Spacer(),
            Column(children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.hatWizard,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Fantasy"',
                onPressed: () {},
              ),
              Text("Fantasy")
            ],),
            Spacer(),
            Column(children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.smile,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Comedy',
                onPressed: () {},
              ),
              Text("Comedy")
            ],),
            Spacer(),
            Column(children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.crosshairs,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Action',
                onPressed: () {},
              ),
              Text("Action")
            ],),
            Spacer(),
          ],),),
          Container(child:
          Row(children: [
            Column(children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.heart,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Romance',
                onPressed: () {},
              ),
              Text("Romance")
            ],),
            Spacer(),
            Column(children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.sun,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Slice of life',
                onPressed: () {},
              ),
              Text("Slice of life")
            ],),
            Spacer(),
            Column(children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.pencil,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Sort story',
                onPressed: () {},
              ),
              Text("Sort story")
            ],),
            Spacer(),
            Column(children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.redditAlien,
                  color: Colors.black,
                  size: 40,
                ),
                tooltip: 'Sci-fi',
                onPressed: () {},
              ),
              Text("Sci-fi")
            ],),
            Spacer(),
          ],),)





        ]
        )
    );
  }
}

class AlignText extends StatelessWidget {
  const AlignText({
    Key? key,
    required this.title,
    required this.size
  }) : super(key: key);
  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: size,fontWeight: FontWeight.bold) ,),
    );
  }
}