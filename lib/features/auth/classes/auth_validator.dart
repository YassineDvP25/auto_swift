class Validators {
  static String? required(String? v) {
    if (v == null || v.trim().isEmpty) return 'This field is required';
    return null;
  }

  static String? email(String? v) {
    if (v == null || v.trim().isEmpty) return 'Enter email';
    final e = v.trim();
    final reg = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,}$');
    if (!reg.hasMatch(e)) return 'Invalid email';
    return null;
  }

  static String? password(String? v) {
    if (v == null || v.isEmpty) return 'Enter password';
    if (v.length < 8) return 'Minimum 8 characters';
    return null;
  }

  static String? confirmPassword(String? v, String original) {
    final base = password(v);
    if (base != null) return base;
    if (v != original) return 'The passwords do not match.';
    return null;
  }
}
