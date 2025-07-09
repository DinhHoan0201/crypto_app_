import 'package:flutter/material.dart';
import 'package:crypto_app/widgets/header.dart';
import 'package:crypto_app/widgets/search_filter.dart';
import 'package:crypto_app/widgets/category_selector.dart';
import 'package:crypto_app/widgets/menu.dart';
import 'package:crypto_app/widgets/coin_list.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const MyHeader(),
            const SizedBox(height: 5),
            const SearchFilter(
              hintText: "Search assets...",
              icon: Icons.search,
              settingsIcon: Icons.tune,
            ),
            const SizedBox(height: 10),
            CategorySelector(),
            const SizedBox(height: 5),

            Expanded(child: CoinList()),
            Menu(),
          ],
        ),
      ),
    );
  }
}
