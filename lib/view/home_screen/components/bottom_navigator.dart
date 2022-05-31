import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  final Function(int) onPress;
  final int currentIndex;

  const BottomNavigator({
    required this.currentIndex,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: 'CATEGORY',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_stories_outlined),
          label: 'CANVAS',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'MY',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.keyboard_control),
          label: 'MORE',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.green,
      onTap: onPress,
    );
  }
}
