import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: () {}, // có thể mở menu ở đây
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: const [
        SizedBox(width: 48), // khoảng cách giữ cân bằng với leading
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
