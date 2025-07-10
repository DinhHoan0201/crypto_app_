import 'package:flutter/material.dart';
import 'package:crypto_app/widgets/header.dart';
import 'package:crypto_app/widgets/menu.dart';
import 'package:crypto_app/screen/follow.dart';
import 'package:crypto_app/screen/home.dart';
import 'package:crypto_app/screen/trade.dart';
import 'package:crypto_app/screen/account.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int selectedIndex = 0;
  final List<String> titles = ['Home', 'Trade', 'Notifications', 'Profile'];
  final List<Widget> screens = [HomePage(), Follow(), Trade(), Account()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHeader(title: titles[selectedIndex]),
      body: SafeArea(child: Follow()), //screens[selectedIndex]
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Menu(
          selectedIndex: selectedIndex,
          onMenuTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
