class UserValidation {
  // Job 2: Validate user data
  bool isValidEmail(String email) {
    return email.contains('@') && email.length > 5;
  }

  bool isValidName(String name) {
    return name.isNotEmpty && name.length >= 2;
  }
}
