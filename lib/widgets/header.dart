import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // giãn cách 2 đầu
        children: [
          Icon(Icons.menu, color: Colors.black),
          Expanded(
            child: Center(
              child: Text(
                'WachList Crypto',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Placeholder cho icon bên phải (có thể là Avatar, Noti, etc)
          SizedBox(
            width: 24, // giữ khoảng cân bằng với icon bên trái
          ),
        ],
      ),
    );
  }
}
