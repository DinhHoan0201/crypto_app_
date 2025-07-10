import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/service/fetch_API.dart';

class Chart extends StatefulWidget {
  final String coinId;
  final int days;

  const Chart({super.key, required this.coinId, this.days = 1});
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> with AutomaticKeepAliveClientMixin {
  List<double> prices = [];
  bool isLoading = true;
  late Timer _timer;

  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    _fetchChartData();
    _timer = Timer.periodic(
      const Duration(minutes: 3),
      (_) => _fetchChartData(),
    );
  }

  Future<void> _fetchChartData() async {
    try {
      final priceList = await fetchCryptoChartdata(widget.coinId, widget.days);
      print('Fetching data for ${widget.coinId}');
      if (mounted && !listEquals(prices, priceList)) {
        setState(() {
          prices = priceList;
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching chart data: $e');
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    super.build(context);
    if (prices.isEmpty) {
      return SizedBox(
        width: 60,
        height: 40,
        child: Center(
          child:
              isLoading
                  ? CircularProgressIndicator()
                  : Text('No data', style: TextStyle(color: Colors.grey)),
        ),
      );
    }
    final isUp = prices.last > prices.first;
    final color = isUp ? Colors.green : Colors.red;
    final areaColor =
        isUp ? Colors.green.withOpacity(0.15) : Colors.red.withOpacity(0.15);

    List<FlSpot> spots = List.generate(
      prices.length,
      (i) => FlSpot(i.toDouble(), prices[i]),
    );

    return SizedBox(
      width: 60,
      height: 40,
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          gridData: FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: color,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: true, color: areaColor),
            ),
          ],
        ),
      ),
    );
  }
}
