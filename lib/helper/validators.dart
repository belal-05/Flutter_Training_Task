class Validators {
// Email validator
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter Email';
    }
    
    final emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegExp.hasMatch(value.trim())) {
      return 'Enter a valid email!';
    }
    return null;
  }

  // Password validator
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter Password';
    } else if (value.trim().length < 8) {
      return 'Password must be at least 8 characters';
  }
    return null;
  }
}