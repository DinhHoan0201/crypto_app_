class CoinListModel {
  final String id;
  final String name;
  final String symbol;
  final double currentPrice;

  CoinListModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.currentPrice,
  });

  factory CoinListModel.fromJson(Map<String, dynamic> json) {
    return CoinListModel(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      currentPrice: json['current_price'].toDouble(),
    );
  }
}
