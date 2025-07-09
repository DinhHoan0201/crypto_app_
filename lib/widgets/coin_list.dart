import 'package:flutter/material.dart';
import 'package:crypto_app/model/coinlist_model.dart';
import 'package:crypto_app/service/fetch_API.dart';
import 'package:crypto_app/widgets/chart.dart';

class CoinList extends StatefulWidget {
  @override
  _CoinListState createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
  List<CoinListModel> coinList = [];
  @override
  void initState() {
    super.initState();
    _fetchCryptoData();
  }

  Future<void> _fetchCryptoData() async {
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  blurRadius: 30,
                  offset: Offset(0, 1),
                ),
              ],
            ),

            child: Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(coin.imageUrl)),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    coin.name,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                Chart(coinId: coin.id),
                const SizedBox(width: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${coin.currentPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    if (coin.priceChangePercentage24h != null)
                      Text(
                        '${coin.priceChangePercentage24h}%',
                        style: TextStyle(
                          color:
                              double.tryParse(coin.priceChangePercentage24h!)! <
                                      0
                                  ? Colors.red
                                  : Colors.green,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
