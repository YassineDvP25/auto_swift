class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  final Map<String, String> _users = {}; // email -> password

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    await Future.delayed(const Duration(milliseconds: 700));
    if (_users.containsKey(email)) {
      throw AuthException('البريد مستخدم بالفعل');
    }
    // في العالم الحقيقي خزّن الهاش وليس الباسورد
    _users[email] = password;
  }

  Future<void> signIn({required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 600));
    final saved = _users[email];
    if (saved == null || saved != password) {
      throw AuthException('بيانات غير صحيحة');
    }
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
  @override
  String toString() => message;
}