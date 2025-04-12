import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/stock_chart.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Portfolio Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'PORTFOLIO',
                  style: GoogleFonts.pressStart2p(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.attach_money, size: 16),
                  label: Text(
                    'ADD FUNDS',
                    style: GoogleFonts.pressStart2p(
                      textStyle: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Portfolio Summary Cards
            GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 3.0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              children: [
                _buildSummaryCard(
                  context,
                  'TOTAL VALUE',
                  '\$24,892.45',
                  '+\$1,245.32 (5.3%)',
                  Icons.trending_up,
                  Colors.green,
                ),
                _buildSummaryCard(
                  context,
                  'CASH BALANCE',
                  '\$3,541.22',
                  'Available for trading',
                  null,
                  null,
                ),
                _buildSummaryCard(
                  context,
                  'TODAY\'S CHANGE',
                  '+\$342.18',
                  '+1.4%',
                  Icons.trending_up,
                  Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Tab Bar
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
              child: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'HOLDINGS',
                      style: GoogleFonts.pressStart2p(
                        textStyle: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'PERFORMANCE',
                      style: GoogleFonts.pressStart2p(
                        textStyle: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'ALLOCATION',
                      style: GoogleFonts.pressStart2p(
                        textStyle: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 16),

            // Tab Content
            SizedBox(
              height: 500,
              child: TabBarView(
                children: [
                  // Holdings Tab
                  _buildHoldingsTab(context),
                  
                  // Performance Tab
                  _buildPerformanceTab(context),
                  
                  // Allocation Tab
                  _buildAllocationTab(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context,
    String title,
    String value,
    String subtitle,
    IconData? icon,
    Color? iconColor,
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
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: title == 'TODAY\'S CHANGE' ? Colors.green : null,
              ),
            ),
            Row(
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: iconColor ?? Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                if (icon != null)
                  Icon(
                    icon,
                    size: 12,
                    color: iconColor,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHoldingsTab(BuildContext context) {
    final List<Map<String, dynamic>> holdings = [
      {
        'symbol': 'AAPL',
        'name': 'Apple Inc.',
        'shares': 15,
        'avgPrice': 150.32,
        'currentPrice': 189.84,
        'value': 2847.60,
        'change': 592.80,
        'changePercent': 26.28,
        'data': [150.0, 155.0, 153.0, 158.0, 160.0, 175.0, 180.0, 185.0, 189.0],
      },
      {
        'symbol': 'MSFT',
        'name': 'Microsoft Corp.',
        'shares': 10,
        'avgPrice': 350.45,
        'currentPrice': 417.88,
        'value': 4178.80,
        'change': 674.30,
        'changePercent': 19.24,
        'data': [380.0, 390.0, 400.0, 395.0, 405.0, 410.0, 415.0, 412.0, 417.0],
      },
      {
        'symbol': 'NVDA',
        'name': 'NVIDIA Corp.',
        'shares': 8,
        'avgPrice': 700.20,
        'currentPrice': 924.79,
        'value': 7398.32,
        'change': 1796.72,
        'changePercent': 32.07,
        'data': [850.0, 870.0, 880.0, 890.0, 900.0, 910.0, 905.0, 915.0, 924.0],
      },
      {
        'symbol': 'AMZN',
        'name': 'Amazon.com Inc.',
        'shares': 12,
        'avgPrice': 160.75,
        'currentPrice': 178.75,
        'value': 2145.00,
        'change': 216.00,
        'changePercent': 11.20,
        'data': [165.0, 168.0, 172.0, 170.0, 175.0, 177.0, 176.0, 177.0, 178.0],
      },
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'YOUR STOCKS',
              style: GoogleFonts.pressStart2p(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Manage your portfolio holdings',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: holdings.length,
                itemBuilder: (context, index) {
                  final stock = holdings[index];
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
                          Text(
                            '${stock['shares']} shares @ \$${stock['avgPrice'].toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\$${stock['value'].toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                                        size: 12,
                                        color: color,
                                      ),
                                      Text(
                                        '\$${stock['change'].toStringAsFixed(2)} (${stock['changePercent'].toStringAsFixed(2)}%)',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: color,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 80,
                                height: 40,
                                child: StockChart(
                                  data: List<double>.from(stock['data']),
                                  color: color,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceTab(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PORTFOLIO PERFORMANCE',
              style: GoogleFonts.pressStart2p(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Track your investment growth over time',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pie_chart,
                        size: 48,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Performance Chart',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Historical performance visualization would appear here',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllocationTab(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ASSET ALLOCATION',
              style: GoogleFonts.pressStart2p(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'View your portfolio diversification',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pie_chart,
                        size: 48,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Allocation Chart',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Asset allocation visualization would appear here',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

