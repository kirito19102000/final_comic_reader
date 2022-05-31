import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_comic_reader/view/details_screen/detail_screen.dart';
import 'package:flutter/material.dart';

class ComicCarousel extends StatefulWidget {
  final List<String> images;

  ComicCarousel({required this.images, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ComicCarouselState();
  }
}



class _ComicCarouselState extends State<ComicCarousel> {

  int _currentIndex = 0;
  int count=0;
  List <int> num=[1,2,3,4,5,6,7,8,9,10];



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlayInterval: const Duration(seconds: 3),
              enableInfiniteScroll: true,
              aspectRatio: 2.0,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: true,
              onPageChanged: (index,other) async{
                setState(() {

                  _currentIndex=index;
                });
              },
              // onPageChanged: (index, other) async {
              //   // _currentIndex = index;
              //   // print(_currentIndex);
              //   // setState(() {});
              // },
            ),
            items: widget.images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return banner(image);
                },
              );
            }).toList(),
          ),
          searchButton(),
          paging(),
        ],
      ),
    );
  }

  banner(String image) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        child: Image.network(image, fit: BoxFit.fill),
        onTap: () {

          Navigator.push(
            context,
            MaterialPageRoute(
              // TODO correct linking to each detail page
              // get comic id and detail screen receives id
              builder: (context) => DetailScreen(idimg: (num[_currentIndex]-1).toString()),
            ),
          );
        },
      ),
    );
  }

  searchButton() {
    return AspectRatio(
      aspectRatio: 2.0,
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
            size: 40,
          ),
          tooltip: 'Search',
          onPressed: () {},
        ),
      ),
    );
  }

  paging() {
    return  AspectRatio(
      aspectRatio: 2.0,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(num[_currentIndex].toString()+'/'+widget.images.length.toString(),style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
