import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailAppBar extends StatelessWidget {

  final String backgroundImage;
  const DetailAppBar({Key? key, required this.backgroundImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.green,
      expandedHeight: 200,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          backgroundImage,
          fit: BoxFit.cover,
        ),
      ),
      actions: [
        Row(
          children: [
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.checkCircle,
                color: Colors.white,
                size: 20,
              ),
              tooltip: 'Action',
              onPressed: () {},
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.exclamationCircle,
                color: Colors.white,
                size: 20,
              ),
              tooltip: 'Action',
              onPressed: () {},
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.arrowCircleDown,
                color: Colors.white,
                size: 20,
              ),
              tooltip: 'Action',
              onPressed: () {},
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.shareAlt,
                color: Colors.white,
                size: 20,
              ),
              tooltip: 'Action',
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }

}