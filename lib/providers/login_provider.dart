import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  bool _isLoggedIn = false;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  bool get isLoggedIn => _isLoggedIn;

  // Ganti URL ini dengan endpoint API autentikasi Anda
  final String _apiUrl = 'https://api-konsultan-konstruksi.com/api/login';

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'success') {
          // Berhasil login
          _isLoggedIn = true;
          _isLoading = false;
          notifyListeners();
          return true;
        } else {
          // Gagal login (contoh: username/password salah)
          _errorMessage = data['message'] ?? 'Gagal login. Periksa kredensial Anda.';
          _isLoggedIn = false;
        }
      } else {
        _errorMessage = 'Terjadi kesalahan pada server.';
      }
    } catch (e) {
      _errorMessage = 'Tidak dapat terhubung ke server. Periksa koneksi internet Anda.';
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  void clearErrorMessage() {
    _errorMessage = '';
    notifyListeners();
  }
}
