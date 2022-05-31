import 'package:flutter/material.dart';

class IconButtonGroup extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function()? onTap;

  const IconButtonGroup(
      {Key? key, required this.name, required this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            print("onTap $name button");
          },
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 40,
          ),
          Text(
            name,
          )
        ],
      ),
    );
  }
}
