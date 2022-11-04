import 'package:flutter/material.dart';

import 'components/body_login_screen.dart';
import 'components/footer_login_screen.dart';
import 'components/header_login_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: const [
              HeaderLoginScreen(),
              BodyLoginScreen(),
              FooterLoginScreen()
            ],
          ),
        ),
      ),
    );
  }
}
