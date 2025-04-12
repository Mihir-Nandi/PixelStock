class PortfolioItem {
  final String symbol;
  final String name;
  final int shares;
  final double avgPrice;
  final double currentPrice;
  final double value;
  final double change;
  final double changePercent;
  final List<double> data;

  PortfolioItem({
    required this.symbol,
    required this.name,
    required this.shares,
    required this.avgPrice,
    required this.currentPrice,
    required this.value,
    required this.change,
    required this.changePercent,
    required this.data,
  });

  factory PortfolioItem.fromJson(Map<String, dynamic> json) {
    return PortfolioItem(
      symbol: json['symbol'],
      name: json['name'],
      shares: json['shares'],
      avgPrice: json['avg_price'],
      currentPrice: json['current_price'],
      value: json['value'],
      change: json['change'],
      changePercent: json['change_percent'],
      data: List<double>.from(json['data']),
    );
  }
}

