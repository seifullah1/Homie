import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AuthService {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void login() {
    _isAuthenticated = true;
  }

  void logout() {
    _isAuthenticated = false;
  }

  Future<bool> _authenticateUser(String phone) async {
    final String response = await rootBundle.loadString(
      'assets/jsons/users.json',
    );
    final List<dynamic> users = jsonDecode(response);

    return users.any((user) => user['phone'] == phone);
  }
}
