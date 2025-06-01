class FieldValidator {
  static String? validateEmail(String? value) {
    if (value == null || !value.contains('@')) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  static String? validateNotEmpty(String? value, {String message = 'Không được để trống'}) {
    if (value == null || value.trim().isEmpty) return message;
    return null;
  }
}
