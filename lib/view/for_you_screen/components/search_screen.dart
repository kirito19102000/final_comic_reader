import 'package:final_comic_reader/view/canvas_screen/components/spotlight_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../details_screen/detail_screen.dart';

class SearchScreen extends StatefulWidget {

  SearchScreen({
    required this.Emty,
    required this.imgURL,
    required this.NameComic,

    Key? key}) : super(key: key);
  final List<String> imgURL,NameComic;
  final List<bool> Emty;

  @override

  _SearchScreenState createState() {
    return _SearchScreenState();}

}

class _SearchScreenState extends State<SearchScreen>{
  List<String> Name=['Doraemon',
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
    'Ore To Kawazu-San No Isekai Hourouki'];
  List<int> idcomi=[1,2,3,4,5,6,7,8,9,10,12,13,14,15,16];
  List<String>? searchc;

  TextEditingController? _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {



    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Column(children: [
        Padding(padding: EdgeInsets.only(top: 10)),
        TextField(
          controller: _textEditingController,
          decoration:  InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "search comic",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue)
              )
          ),
          onChanged: (value){
            setState(() {
              searchc =Name.where((element) => element.contains(value.toLowerCase())).toList();

            });
          },
        ),
        Expanded(child: ListView.builder(
            itemCount: _textEditingController!.text.isNotEmpty
            ?searchc!.length
            :Name.length,
            itemBuilder: (context,index){
              return ListTile(
                leading: Image.network(widget.imgURL[index],fit: BoxFit.cover,),
                title: Text(_textEditingController!.text.isNotEmpty
                    ?searchc![index]
                    :Name[index]),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // TODO correct linking to each detail page
                      // get comic id and detail screen receives id
                      builder: (context) => DetailScreen(idimg: index.toString(),Emty: widget.Emty[index],),
                    ),
                  );
                },
              );

        }
        ))
      ],),
    );


  }

  
}

