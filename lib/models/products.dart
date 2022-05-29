import 'package:flutter/material.dart';

class Product {
  final String imageURL, title, description, tag, creators, lastup;
  final int view, size, id;
  final Color color;
  final Function press;
  final double csize;

  Product(
      {required this.id,
      required this.imageURL,
      required this.title,
      required this.view,
      required this.description,
      required this.tag,
      required this.size,
      required this.color,
      required this.press,
      required this.csize,
      required this.creators,
      required this.lastup});
}

List<Product> products = [
  Product(
      id: 1,
      title: "One puch_man",
      view: 234412421414,
      size: 12,
      tag: "action",
      description: "dummyText",
      imageURL: "https://cdn-amz.fadoglobal.io/images/I/81r1n+TfLSS.jpg",
      press: () {},
      csize: 0.7,
      creators: "one one",
      lastup: "May 20,2022 ",
      color: const Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Naruto",
      view: 234123213,
      size: 8,
      tag: "action",
      description: "dummyText",
      imageURL:
          "https://upload.wikimedia.org/wikipedia/vi/c/c7/Naruto_Volume_1_manga_cover.jpg",
      press: () {},
      csize: 0.7,
      creators: "Masashi Kishimoto",
      lastup: "Apr 5,2022 ",
      color: const Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Doremon",
      view: 2341231231,
      size: 10,
      tag: "children",
      description: "dummyText",
      imageURL:
          "https://cdna.artstation.com/p/assets/images/images/026/941/604/medium/kaustubh-chaudhary-doremon-pink.jpg?1590151532",
      press: () {},
      csize: 0.7,
      creators: "Fujiko Fujio",
      lastup: "Apr 1,2022 ",
      color: const Color(0xFF989493)),
  Product(
      id: 4,
      title: "Old Fashion",
      view: 234412414,
      size: 11,
      tag: "children",
      description: "dummyText",
      imageURL:
          "https://cdna.artstation.com/p/assets/images/images/026/941/604/medium/kaustubh-chaudhary-doremon-pink.jpg?1590151532",
      press: () {},
      csize: 0.7,
      creators: "Fujiko Fujio",
      lastup: "Apr 1,2022 ",
      color: const Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Fairy tail",
      view: 234123123,
      size: 12,
      tag: "action",
      description: "dummyText",
      imageURL:
          "https://upload.wikimedia.org/wikipedia/vi/e/e1/FairyTail-Volume_1_Cover.jpg",
      press: () {},
      csize: 0.7,
      creators: "Hiro Mashima",
      lastup: "May 5,2022 ",
      color: const Color(0xFFFB7883)),
  Product(
      id: 6,
      title: "Fairy tail",
      view: 234123123,
      size: 12,
      tag: "romantic",
      description: "dummyText",
      imageURL:
          "https://upload.wikimedia.org/wikipedia/vi/e/e1/FairyTail-Volume_1_Cover.jpg",
      press: () {},
      csize: 0.7,
      creators: "Hiro Mashima",
      lastup: "May 25,2022 ",
      color: const Color(0xFFFB7883)),
  Product(
      id: 7,
      title: "Kaiju No.8",
      view: 234123123,
      size: 12,
      tag: "action",
      description: "dummyText",
      imageURL: "https://upload.wikimedia.org/wikipedia/en/c/cd/Kaiju_No_8.jpg",
      press: () {},
      csize: 0.7,
      creators: "MATSUMOTO Naoya",
      lastup: "May 14,2022 ",
      color: const Color(0xFFFB7883)),
  Product(
      id: 8,
      title: "The Beginning Af...",
      view: 234123123,
      size: 12,
      tag: "action",
      description: "dummyText",
      imageURL:
          "https://1.bp.blogspot.com/-2w6LVMWQ_u4/XvB5Au-m5BI/AAAAAAAAAXI/qPfJVpJVaJU8r6NK5xb7c_9n1SE93rbiQCK4BGAsYHg/s1079/100967082_541363706529705_1461401849995970560_n.jpg",
      press: () {},
      csize: 0.7,
      creators: "TurtleMe",
      lastup: "May 3,2022 ",
      color: const Color(0xFFFB7883)),
  Product(
      id: 9,
      title: "Toaru Majutsu...",
      view: 234123123,
      size: 12,
      tag: "action",
      description: "dummyText",
      imageURL:
          "http://tintruyen.net/12345/14/0.jpg?gf=hdfgdfg",
      press: () {},
      csize: 0.7,
      creators: "Kamachi Kazuma",
      lastup: "May 5,2021 ",
      color: const Color(0xFFFB7883)),
  Product(
      id: 10,
      title: "bleach",
      view: 234123123,
      size: 12,
      tag: "romantic",
      description: "dummyText",
      imageURL:
          "https://upload.wikimedia.org/wikipedia/en/7/72/Bleachanime.png",
      press: () {},
      csize: 0.7,
      creators: "Tite Kubo",
      lastup: "May 5,2020 ",
      color: const Color(0xFFFB7883)),
];
