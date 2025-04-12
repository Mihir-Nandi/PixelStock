class SentimentData {
  final String symbol;
  final String name;
  final String sentiment;
  final int score;
  final double change;
  final int news;
  final int social;
  final int analyst;

  SentimentData({
    required this.symbol,
    required this.name,
    required this.sentiment,
    required this.score,
    required this.change,
    required this.news,
    required this.social,
    required this.analyst,
  });

  factory SentimentData.fromJson(Map<String, dynamic> json) {
    return SentimentData(
      symbol: json['symbol'],
      name: json['name'],
      sentiment: json['sentiment'],
      score: json['score'],
      change: json['change'],
      news: json['news'],
      social: json['social'],
      analyst: json['analyst'],
    );
  }
}

