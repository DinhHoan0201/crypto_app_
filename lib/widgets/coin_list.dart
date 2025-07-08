import 'package:flutter/material.dart';
import 'package:crypto_app/model/coinlist_model.dart';
import 'package:crypto_app/service/fetch_API.dart';

class CoinList extends StatefulWidget {
  @override
  _CoinListState createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
  List<CoinListModel> coinList = [];

  @override
  void initState() {
    super.initState();
    fetchCoinList();
  }

  Future<void> fetchCoinList() async {
    try {
      final data = await fetchCryptoData();
      setState(() {
        coinList =
            data
                .map<CoinListModel>((item) => CoinListModel.fromJson(item))
                .toList();
      });
    } catch (e) {
      print('Error fetching coin list: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coinList.length,
      itemBuilder: (context, index) {
        final coin = coinList[index];
        return ListTile(
          title: Text(coin.name),
          subtitle: Text(coin.symbol.toUpperCase()),
          trailing: Text('\$${coin.currentPrice.toStringAsFixed(2)}'),
        );
      },
    );
  }
}
