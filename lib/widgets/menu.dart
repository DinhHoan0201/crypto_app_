import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final List<IconData> menuIcons = [
    Icons.home,
    Icons.trending_up,
    Icons.notifications,
    Icons.account_circle,
  ];
  int selectedIndex = 0;
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuIcons.length, (index) {
        final isSelected = index == selectedIndex;
        return GestureDetector(
          onTap:
              () => {
                setState(() {
                  selectedIndex = index;
                }),
              },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

            child: Icon(
              menuIcons[index],
              color: isSelected ? Colors.yellow[300] : Colors.grey[300],
              size: 30,
            ),
          ),
        );
      }),
    );
  }
}
