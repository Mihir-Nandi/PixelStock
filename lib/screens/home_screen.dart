import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/stock_chart.dart';
import '../widgets/top_stocks.dart';
import '../globals.dart'; // Import your WebSocket service

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    webSocketService.stockUpdates.addListener(_updateState);
  }

  @override
  void dispose() {
    webSocketService.stockUpdates.removeListener(_updateState);
    super.dispose();
  }

  void _updateState() {
    setState(() {}); // triggers UI rebuild on data update
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MARKET OVERVIEW',
            style: GoogleFonts.pressStart2p(
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildMarketCard(
                context,
                'S&P 500',
                'US Large Cap',
                getPrice('SPX'),
                getChangeText('SPX'),
                getData('SPX'),
                getColor('SPX'),
              ),
              const SizedBox(height: 12),
              _buildMarketCard(
                context,
                'NASDAQ',
                'US Tech',
                getPrice('NDX'),
                getChangeText('NDX'),
                getData('NDX'),
                getColor('NDX'),
              ),
              const SizedBox(height: 12),
              _buildMarketCard(
                context,
                'DOW JONES',
                'US Blue Chip',
                getPrice('DJI'),
                getChangeText('DJI'),
                getData('DJI'),
                getColor('DJI'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TOP MOVERS',
                    style: GoogleFonts.pressStart2p(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TopStocks(),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        'VIEW ALL STOCKS',
                        style: GoogleFonts.pressStart2p(
                          textStyle: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMarketCard(
    BuildContext context,
    String title,
    String subtitle,
    String price,
    String change,
    List<double> data,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.pressStart2p(
                textStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              subtitle,
              style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            change,
                            style: TextStyle(
                              fontSize: 10,
                              color: color,
                            ),
                          ),
                          Icon(
                            Icons.trending_up,
                            size: 10,
                            color: color,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 80,
                  height: 40,
                  child: StockChart(data: data, color: color),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper functions to extract live data

  String getPrice(String symbol) {
    final stock = webSocketService.stockUpdates.value[symbol];
    if (stock != null) {
      return stock['price'].toStringAsFixed(2);
    }
    return '0.00';
  }

  String getChangeText(String symbol) {
    final stock = webSocketService.stockUpdates.value[symbol];
    if (stock != null) {
      final change = stock['change'] ?? 0.0;
      final percent = stock['change_percent'] ?? 0.0;
      final sign = change >= 0 ? '+' : '';
      return '$sign${change.toStringAsFixed(2)} ($sign${percent.toStringAsFixed(2)}%)';
    }
    return '+0.00 (0.00%)';
  }

  List<double> getData(String symbol) {
    final stock = webSocketService.stockUpdates.value[symbol];
    if (stock != null && stock['chart'] != null) {
      return List<double>.from(stock['chart']);
    }
    return List<double>.filled(9, 0.0); // fallback dummy data
  }

  Color getColor(String symbol) {
    final stock = webSocketService.stockUpdates.value[symbol];
    if (stock != null && (stock['change'] ?? 0.0) < 0) {
      return Colors.red;
    }
    return Colors.green;
  }
}
