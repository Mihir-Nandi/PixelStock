import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/stock_chart.dart';
import '../services/websocket_service.dart';
import '../globals.dart'; // Access webSocketService

class TopStocks extends StatefulWidget {
  const TopStocks({super.key});

  @override
  State<TopStocks> createState() => _TopStocksState();
}

class _TopStocksState extends State<TopStocks> {
  @override
  void initState() {
    super.initState();
    webSocketService.stockUpdates.addListener(_onStockUpdate);
  }

  @override
  void dispose() {
    webSocketService.stockUpdates.removeListener(_onStockUpdate);
    super.dispose();
  }

  void _onStockUpdate() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final stocks = webSocketService.stockUpdates.value.values.toList();

    // Sort by top percentage change and get top 5
    stocks.sort((a, b) =>
        (b['changePercent'] as num).compareTo(a['changePercent'] as num));
    final top5 = stocks.take(5).toList();

    return Column(
      children: List.generate(top5.length, (index) {
        final stock = top5[index];
        final isPositive = stock['change'] >= 0;
        final color = isPositive ? Colors.green : Colors.red;

        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: Row(
              children: [
                Text(
                  stock['symbol'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    stock['name'] ?? '',
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${(stock['price'] as num).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          isPositive
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          size: 12,
                          color: color,
                        ),
                        Text(
                          '${isPositive ? '+' : ''}${(stock['change'] as num).toStringAsFixed(2)} (${(stock['changePercent'] as num).toStringAsFixed(2)}%)',
                          style: TextStyle(fontSize: 12, color: color),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 80,
                  height: 40,
                  child: StockChart(
                    data: List<double>.from(stock['data'] ?? []),
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
