class EmailValidation {
  bool isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }
}
