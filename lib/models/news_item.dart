class NewsItem {
  final String title;
  final String description;
  final String source;
  final String time;
  final String date;
  final String category;
  final List<String> tickers;

  NewsItem({
    required this.title,
    required this.description,
    required this.source,
    required this.time,
    required this.date,
    required this.category,
    required this.tickers,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      title: json['title'],
      description: json['description'],
      source: json['source'],
      time: json['time'],
      date: json['date'],
      category: json['category'],
      tickers: List<String>.from(json['tickers']),
    );
  }
}

