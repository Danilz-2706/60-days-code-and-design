import 'dart:async';

import 'package:login_with_bloc/validators/validations.dart';

class LoginBloc {
  final StreamController _usernameController = StreamController();
  final StreamController _passwordController = StreamController();

  Stream get username => _usernameController.stream;
  Stream get password => _passwordController.stream;

  bool isValidInfo(String username, String password) {
    if (!Validations.isValidUsername(username)) {
      _usernameController.sink.addError("Please re-enter email");
      return false;
    }
    _usernameController.sink.add("Succesful");
    if (!Validations.isValidPassword(password)) {
      _passwordController.sink.addError("Please re-enter password");
      return false;
    }
    _passwordController.sink.add("Succesful");

    return true;
  }

  void dispose() {
    _usernameController.close();
    _passwordController.close();
  }
}
