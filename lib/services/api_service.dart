import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../models/stock.dart';
import '../models/portfolio_item.dart';
import '../models/news_item.dart';
import '../models/sentiment_data.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.1.11:8001/api';

  Future<Map<String, String>> _getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Token $token',
    };
  }

  Future<User> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username.trim(),
        'password': password.trim(),
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // 👇 Build User manually from nested response
      final user = User(
        id: data['user']['id'],
        username: data['user']['username'],
        email: data['user']['email'],
        token: data['access'], // Use access token
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', user.token);

      return user;
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  Future<User> register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      if (response.body.isNotEmpty) {
        final data = jsonDecode(response.body);
        return User.fromJson(data);
      } else {
        // Handle empty body but success
        return User(
          id: 0,
          username: username,
          email: email,
          token: '',
        );
      }
    } else {
      throw Exception('Failed to register: ${response.body}');
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  Future<List<Map<String, dynamic>>> getMarketOverview() async {
    final headers = await _getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/market/overview/'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load market overview');
    }
  }

  Future<List<Stock>> getTopStocks() async {
    final headers = await _getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/stocks/top/'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Stock>.from(
        data.map((item) => Stock.fromJson(item)),
      );
    } else {
      throw Exception('Failed to load top stocks');
    }
  }

  Future<List<PortfolioItem>> getPortfolio() async {
    final headers = await _getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/portfolio/'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<PortfolioItem>.from(
        data.map((item) => PortfolioItem.fromJson(item)),
      );
    } else {
      throw Exception('Failed to load portfolio');
    }
  }

  Future<List<NewsItem>> getNews() async {
    final headers = await _getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/news/'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<NewsItem>.from(
        data.map((item) => NewsItem.fromJson(item)),
      );
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<Map<String, dynamic>> getSentimentOverview() async {
    final headers = await _getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/sentiment/overview/'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load sentiment overview');
    }
  }

  Future<List<SentimentData>> getStockSentiment() async {
    final headers = await _getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/sentiment/stocks/'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<SentimentData>.from(
        data.map((item) => SentimentData.fromJson(item)),
      );
    } else {
      throw Exception('Failed to load stock sentiment');
    }
  }
}
