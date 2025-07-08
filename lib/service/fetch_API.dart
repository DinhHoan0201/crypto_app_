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
      return data;
    } else {
      throw Exception('Failed to load crypto data');
    }
  } catch (error) {
    print('Error fetching crypto data: $error');
    rethrow;
  }
}
