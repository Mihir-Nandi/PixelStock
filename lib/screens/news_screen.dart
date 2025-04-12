import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> newsItems = [
      {
        'title': 'Fed Signals Potential Rate Cuts Later This Year',
        'description': 'The Federal Reserve indicated it may begin cutting interest rates in the coming months as inflation shows signs of cooling.',
        'source': 'Financial Times',
        'time': '2 hours ago',
        'date': 'Mar 25, 2025',
        'category': 'Economy',
        'tickers': ['SPY', 'QQQ', 'DIA'],
      },
      {
        'title': 'Apple Unveils New AI Features for iPhone',
        'description': 'Apple announced a suite of new AI-powered features coming to iPhones later this year, intensifying competition with Google and Microsoft.',
        'source': 'Tech Insider',
        'time': '5 hours ago',
        'date': 'Mar 25, 2025',
        'category': 'Technology',
        'tickers': ['AAPL', 'GOOGL', 'MSFT'],
      },
      {
        'title': 'Oil Prices Surge Amid Middle East Tensions',
        'description': 'Crude oil prices jumped 3% following reports of escalating geopolitical tensions in the Middle East, raising concerns about supply disruptions.',
        'source': 'Energy Report',
        'time': '1 day ago',
        'date': 'Mar 24, 2025',
        'category': 'Commodities',
        'tickers': ['USO', 'XLE', 'CVX'],
      },
      {
        'title': 'Nvidia Announces Next-Gen AI Chips',
        'description': 'Nvidia unveiled its next generation of AI accelerator chips, claiming 2x performance over previous models, sending shares to new all-time highs.',
        'source': 'Tech Report',
        'time': '1 day ago',
        'date': 'Mar 24, 2025',
        'category': 'Technology',
        'tickers': ['NVDA', 'AMD', 'INTC'],
      },
      {
        'title': 'Retail Sales Beat Expectations in February',
        'description': 'U.S. retail sales rose more than expected last month, suggesting consumer spending remains resilient despite higher interest rates.',
        'source': 'Market Watch',
        'time': '2 days ago',
        'date': 'Mar 23, 2025',
        'category': 'Economy',
        'tickers': ['XRT', 'WMT', 'AMZN'],
      },
      {
        'title': 'Healthcare Stocks Rally on Medicare Policy Changes',
        'description': 'Healthcare stocks surged after the government announced favorable changes to Medicare reimbursement rates for certain procedures.',
        'source': 'Health Finance',
        'time': '3 days ago',
        'date': 'Mar 22, 2025',
        'category': 'Healthcare',
        'tickers': ['XLV', 'UNH', 'JNJ'],
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MARKET NEWS',
            style: GoogleFonts.pressStart2p(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.5,
              mainAxisSpacing: 16,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: newsItems.length,
            itemBuilder: (context, index) {
              final news = newsItems[index];
              return _buildNewsCard(context, news);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(BuildContext context, Map<String, dynamic> news) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    news['category'],
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 12),
                    const SizedBox(width: 4),
                    Text(
                      news['time'],
                      style: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              news['title'],
              style: GoogleFonts.pressStart2p(
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 12),
                const SizedBox(width: 4),
                Text(
                  '${news['date']} | ${news['source']}',
                  style: TextStyle(
                    fontSize: 10,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                news['description'],
                style: const TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: (news['tickers'] as List<String>).map((ticker) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '\$$ticker',
                    style: const TextStyle(fontSize: 10),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(36),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Read Full Story',
                    style: GoogleFonts.pressStart2p(
                      textStyle: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_upward, size: 14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

