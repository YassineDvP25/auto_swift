import 'package:auto_swift/features/auth/classes/auth_service.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  set _setLoading(bool v) {
    _loading = v;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    _setLoading = true;
    try {
      await AuthService.instance.signIn(email: email, password: password);
      return true;
    } on AuthException catch (_) {
      rethrow;
    } finally {
      _setLoading = false;
    }
  }

  Future<bool> register(String name, String email, String password) async {
    _setLoading = true;
    try {
      await AuthService.instance.signUp(
        email: email,
        password: password,
        fullName: name,
      );
      return true;
    } on AuthException catch (_) {
      rethrow;
    } finally {
      _setLoading = false;
    }
  }
}