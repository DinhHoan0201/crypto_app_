// lib/services/crypto_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchCryptoData() async {
  final url =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false';

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("fetching...");
      return data;
    } else {
      throw Exception('Failed to load crypto data');
    }
  } catch (error) {
    print('Error fetching crypto data: $error');
    rethrow;
  }
}

Future<List<double>> fetchCryptoChartdata(String coinId, int days) async {
  final url =
      'https://api.coingecko.com/api/v3/coins/$coinId/market_chart?vs_currency=usd&days=$days';

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 429) {
      throw Exception('Rate limit exceeded. Please wait a moment.');
    }
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> prices = data['prices'];

      final List<double> priceList =
          prices.map<double>((entry) => (entry[1] as num).toDouble()).toList();

      return priceList;
    } else {
      throw Exception('Failed to load crypto chart data');
    }
  } catch (error) {
    print('Error fetching crypto chart data: $error');
    rethrow;
  }
}
