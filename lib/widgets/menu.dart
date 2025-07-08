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
            decoration: BoxDecoration(
              color: isSelected ? Colors.yellow : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(menuIcons[index]),
          ),
        );
      }),
    );
  }
}
