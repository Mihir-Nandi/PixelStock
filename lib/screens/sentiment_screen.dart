import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SentimentScreen extends StatelessWidget {
  const SentimentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> stockSentiment = [
      {
        'symbol': 'AAPL',
        'name': 'Apple Inc.',
        'sentiment': 'Bullish',
        'score': 78,
        'change': 3.2,
        'news': 24,
        'social': 65,
        'analyst': 85,
      },
      {
        'symbol': 'MSFT',
        'name': 'Microsoft Corp.',
        'sentiment': 'Bullish',
        'score': 82,
        'change': 1.5,
        'news': 32,
        'social': 75,
        'analyst': 90,
      },
      {
        'symbol': 'GOOGL',
        'name': 'Alphabet Inc.',
        'sentiment': 'Neutral',
        'score': 52,
        'change': -2.1,
        'news': 18,
        'social': 48,
        'analyst': 65,
      },
      {
        'symbol': 'AMZN',
        'name': 'Amazon.com Inc.',
        'sentiment': 'Bullish',
        'score': 71,
        'change': 4.3,
        'news': 28,
        'social': 70,
        'analyst': 75,
      },
      {
        'symbol': 'TSLA',
        'name': 'Tesla Inc.',
        'sentiment': 'Bearish',
        'score': 35,
        'change': -5.7,
        'news': 42,
        'social': 30,
        'analyst': 40,
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MARKET SENTIMENT',
            style: GoogleFonts.pressStart2p(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Sentiment Overview Cards
          GridView.count(
            crossAxisCount: 1,
            childAspectRatio: 3.0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            children: [
              _buildSentimentCard(
                context,
                'OVERALL SENTIMENT',
                'BULLISH',
                '+2.3 points',
                65,
                Colors.green,
              ),
              _buildSentimentCard(
                context,
                'FEAR & GREED',
                'GREED',
                '+5.1 points',
                72,
                Colors.amber,
              ),
              _buildSentimentCard(
                context,
                'VOLATILITY',
                'LOW',
                '-1.8 points',
                18,
                Colors.blue,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Stock Sentiment Analysis
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'STOCK SENTIMENT ANALYSIS',
                    style: GoogleFonts.pressStart2p(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Analyze market sentiment for specific stocks',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter stock symbol...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: stockSentiment.length,
                    itemBuilder: (context, index) {
                      final stock = stockSentiment[index];
                      return _buildStockSentimentCard(context, stock);
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                    ),
                    child: Text(
                      'ANALYZE MORE STOCKS',
                      style: GoogleFonts.pressStart2p(
                        textStyle: const TextStyle(
                          fontSize: 12,
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

  Widget _buildSentimentCard(
    BuildContext context,
    String title,
    String value,
    String change,
    int score,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.pressStart2p(
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          change,
                          style: TextStyle(
                            fontSize: 12,
                            color: color,
                          ),
                        ),
                        Icon(
                          change.startsWith('+') ? Icons.trending_up : Icons.trending_down,
                          size: 12,
                          color: color,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      score.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStockSentimentCard(BuildContext context, Map<String, dynamic> stock) {
    Color sentimentColor;
    if (stock['sentiment'] == 'Bullish') {
      sentimentColor = Colors.green;
    } else if (stock['sentiment'] == 'Bearish') {
      sentimentColor = Colors.red;
    } else {
      sentimentColor = Colors.amber;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  stock['symbol'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  stock['name'],
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: sentimentColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                stock['sentiment'],
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sentiment Score',
                      style: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                    Text(
                      stock['score'].toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          stock['change'] >= 0 ? Icons.arrow_upward : Icons.arrow_downward,
                          size: 12,
                          color: stock['change'] >= 0 ? Colors.green : Colors.red,
                        ),
                        Text(
                          '${stock['change'].toStringAsFixed(1)} pts',
                          style: TextStyle(
                            fontSize: 10,
                            color: stock['change'] >= 0 ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildSentimentSource(context, 'News', stock['news']),
                    const SizedBox(width: 16),
                    _buildSentimentSource(context, 'Social', stock['social']),
                    const SizedBox(width: 16),
                    _buildSentimentSource(context, 'Analyst', stock['analyst']),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSentimentSource(BuildContext context, String label, int value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

