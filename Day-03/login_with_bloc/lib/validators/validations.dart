class Validations {
  static bool isValidUsername(String username) {
    return username.length > 8 &&
        username.contains("@") &&
        username.contains(".");
  }

  static bool isValidPassword(String password) {
    return password.length > 8;
  }
}
