import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../models/products.dart';
import 'my_series.dart';
import 'daily_comic.dart';
import 'title_with_more_btn.dart';
import '../../../constants.dart';
import 'recommend_comic.dart';
import 'new_comic_originals_recomend.dart';
import 'scroll_view_comic.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';
import '../../details_screen/main_screen.dart';



class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

final List<String> imgUrl=[products[0].imageURL,
  products[1].imageURL,
  products[2].imageURL,
  products[3].imageURL,];



class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {

    int _current=0;
    int currentIndex=0;
    Size size = MediaQuery.of(context).size;


    return  Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: ListView(
      shrinkWrap: true,
      children: <Widget>[



        Container(height: 200,
          child: Stack(children: [
            CarouselSlider(
              options: CarouselOptions(
                enableInfiniteScroll: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                autoPlay: true,
                onPageChanged: (index,other) async{

                    _current=index;
                    print( _current);
                    setState(() {

                    });

                },
              ),
              items: imgUrl.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: GestureDetector(
                            child: Image.network(i, fit: BoxFit.fill),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const DetailsScreen()),
                              );
                            }));
                  },
                );
              }).toList(),

            ),

            AspectRatio(aspectRatio: 2.0,child: Align(alignment: Alignment.topRight,child: IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
                size: 40,
              ),
              tooltip: 'Search',
              onPressed: () {},
            ),),),
            
            AspectRatio(aspectRatio: 2.0,child: Align(alignment: Alignment.bottomRight,child: Text("data"),),)
          ],),),



        TitleWithMoreBtn(text: "My Series",press: () {},),

        SeriesScrollViewComic(size: size),

        Container(
            margin: EdgeInsets.only(
              top: kDefaultPadding,)),

        TitleWithMoreBtn(text: "New WEBTOON ORIGINALS",press: () {},),
        ScrollViewRecomedNewComic(size: size),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),



        TitleWithMoreBtn(text: "Daily",press: () {},),
        DailyComicGridView(itemNum: 6,),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),



        TitleWithMoreBtn(text: "Top Completed Series",press: () {},),
        ScrollViewComic(size: size),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const DetailsScreen()),
                                );
                          },
                            child: Container(child:
                            Row(children: [
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

        Container(margin: EdgeInsets.all(kDefaultPadding/2),),



        TitleWithMoreBtn(text: "All Time Favorties ",press: () {},),
        Container(height: 250,
          child: Column(children: [
            Stack(children: [
              CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  aspectRatio: 18/8,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  onPageChanged: (index,other){
                    _current=index;
                    setState(() {

                    });

                  },
                ),
                items: imgUrl.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: GestureDetector(
                              child: Image.network(i, fit: BoxFit.fill),
                              onTap: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const DetailsScreen()),
                                );
                              }));
                    },
                  );
                }).toList(),

              ),
            ],),
            Align(alignment: Alignment.centerLeft,
              child: Row(children: [
                Text("Name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Text("\t\tdata",style: TextStyle(color: Colors.green),)],
              ),
            ),
            Align(alignment: Alignment.centerLeft,child: Text("dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",style: TextStyle(color: Colors.grey),),)


          ],
          ),
        ),
        

        Container(margin: EdgeInsets.all(kDefaultPadding),),



        TextGestureDetector(toptext: "Exiciting Stories on CANVS",bottomtext: "Series from out Self-Publishing Creators",),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),

        AlignText(
          title: "Staff Picks",
          size: 15,),
        Container(margin: EdgeInsets.all(kDefaultPadding/4),),
        ScrollViewComic(size: size),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),

        AlignText(
          title: "Hidden Gems",
          size: 15,),
        Container(margin: EdgeInsets.all(kDefaultPadding/4),),
        ScrollViewComic(size: size),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),

        AlignText(
          title: "Today's Hot Series",
          size: 15,),
        Container(margin: EdgeInsets.all(kDefaultPadding/4),),
        ScrollViewComic(size: size),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),

        AlignText(
          title: "Romance",
          size: 15,),
        Container(margin: EdgeInsets.all(kDefaultPadding/4),),
        ScrollViewComic(size: size),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),

        AlignText(
          title: "Rising Stars",
          size: 15,),
        Container(margin: EdgeInsets.all(kDefaultPadding/4),),
        ScrollViewComic(size: size),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),

        AlignText(
          title: "Drama",
          size: 15,),
        Container(margin: EdgeInsets.all(kDefaultPadding/4),),
        ScrollViewComic(size: size),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),

        AlignText(
          title: "Comedy/Slice-of-Life",
          size: 15,),
        Container(margin: EdgeInsets.all(kDefaultPadding/4),),
        ScrollViewComic(size: size),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),

        AlignText(
          title: "Epic Adventures",
          size: 15,),
        Container(margin: EdgeInsets.all(kDefaultPadding/4),),
        ScrollViewComic(size: size),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),

        AlignText(
          title: "Spotlight",
          size: 15,),
        Container(margin: EdgeInsets.all(kDefaultPadding/4),),
        ScrollViewComic(size: size),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),

        AlignText(
          title: "Binge-worthy Series",
          size: 15,),
        Container(margin: EdgeInsets.all(kDefaultPadding/4),),
        ScrollViewComic(size: size),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),

        AlignText(
          title: "Genres",
          size: 15,),
        GemresWidget(),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),

        Text("Find your series",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
        Container(margin: EdgeInsets.all(kDefaultPadding/4),),
        GestureDetector(
          onTap: (){
            print("Click event on Container");
          },
          child: Card(elevation:2,child: Image.network("https://photo.techrum.vn/images/2022/01/02/doremon-remake-TECHRUM-cover966645bc9366d3aa.jpg",fit: BoxFit.fitWidth,height: 60,)),
        ),

        AlignText(title: "Looking for something dangeruos?", size: 15),
        Container(margin: EdgeInsets.all(kDefaultPadding/4),),

        SizedBox(
          height: 250.0,
          width: double.infinity,
          child: Carousel(
            dotSize: 6.0,
            dotSpacing: 15.0,
            dotPosition: DotPosition.bottomCenter,
            images: [
              Image.network('https://photo.techrum.vn/images/2022/01/02/doremon-remake-TECHRUM-cover966645bc9366d3aa.jpg', fit: BoxFit.cover),
              Image.network('https://photo.techrum.vn/images/2022/01/02/doremon-remake-TECHRUM-cover966645bc9366d3aa.jpg', fit: BoxFit.cover),
              Image.network('https://upload.wikimedia.org/wikipedia/en/7/72/Bleachanime.png', fit: BoxFit.cover),
              Image.network('https://upload.wikimedia.org/wikipedia/en/7/72/Bleachanime.png', fit: BoxFit.cover),
              Image.network('https://upload.wikimedia.org/wikipedia/en/7/72/Bleachanime.png', fit: BoxFit.cover),
              Image.network('https://upload.wikimedia.org/wikipedia/en/7/72/Bleachanime.png', fit: BoxFit.cover),
            ],
          ),),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),


        TitleWithMoreBtn(text: "Daily",press: () {},),
        TitleWithMoreBtn(text: "Ranking",press: () {},),
        TitleWithMoreBtn(text: "Genres",press: () {},),
        TitleWithMoreBtn(text: "Fan Translation",press: () {},),
        TitleWithMoreBtn(text: "Setting",press: () {},),

        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "__________________________________________________________",
            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey) ,),
        ),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),

        TitleWithMoreBtn(text: "Notice",press: () {},),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "asdadasd",
            style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.grey) ,),
        ),
        Container(margin: EdgeInsets.all(kDefaultPadding/2),),

        Container(child:
          Row(children: [
            IconButton(
              icon: const Icon(
                Icons.facebook,
                color: Colors.black,
                size: 40,
              ),
              tooltip: 'Search',
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.black,
                size: 40,
              ),
              tooltip: 'Search',
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.instagram,
                color: Colors.black,
                size: 40,
              ),
              tooltip: 'Search',
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.youtube,
                color: Colors.black,
                size: 40,
              ),
              tooltip: 'Search',
              onPressed: () {},
            ),
          ],)),

        new Center(

          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              side: BorderSide(width: 1.5, color: Colors.grey),
            ),
            onPressed: () {
              print("Click event on Container");
            },

            child: Text("Sahre WEBTOON",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          ),)







      ],
    ),);

  }
}

class GemresWidget extends StatelessWidget {
  const GemresWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child:
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
    ],),);
  }
}



class TextGestureDetector extends StatelessWidget {
  const TextGestureDetector({
    Key? key,
    required this.bottomtext,
    required this.toptext
  }) : super(key: key);
  final String toptext,bottomtext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Click event on Container");
      },
      child:Container(
        margin: EdgeInsets.only(
          right: kDefaultPadding,
        ),
        color: Colors.white,

        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),

              child: Row(
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: toptext+"\n",
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: bottomtext,
                              style: TextStyle(color: Colors.grey,fontSize: 10),
                            ),
                          ]
                      )
                  )
                ],
              ),
            ),

          ],
        ),
      ),
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


