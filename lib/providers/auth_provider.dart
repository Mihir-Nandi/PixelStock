import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  bool _isLoading = false;
  String? _error;
  final ApiService _apiService = ApiService();

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _user != null;

  AuthProvider() {
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token != null) {
      // TODO: Implement token validation or user info fetch
      // For now, we'll just set a placeholder user
      _user = User(
        id: 0,
        username: 'User',
        email: '',
        token: token,
      );
      notifyListeners();
    }
  }

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _apiService.login(username, password);

      // ✅ Save token to shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', _user!.token);

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(String username, String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _apiService.register(username, email, password);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    await _apiService.logout();

    // ✅ Remove token from shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');

    _user = null;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
