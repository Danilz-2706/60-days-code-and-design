import 'package:flutter/material.dart';
import 'package:login_with_bloc/blocs/login_bloc.dart';
import 'package:login_with_bloc/screens/home/home_screen.dart';

import '../../../components/input_text_field.dart';

class BodyLoginScreen extends StatefulWidget {
  const BodyLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyLoginScreen> createState() => _BodyLoginScreenState();
}

class _BodyLoginScreenState extends State<BodyLoginScreen> {
  LoginBloc loginBloc = LoginBloc();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 145, 0, 20),
          child: StreamBuilder(
            stream: loginBloc.username,
            builder: (context, snapshot) => InputTextField(
              controller: emailController,
              labelText: "Email",
              image: "assets/icons/ic_mail.png",
              errorText: snapshot.hasError ? snapshot.error : null,
            ),
          ),
        ),
        StreamBuilder(
          stream: loginBloc.password,
          builder: (context, snapshot) => InputTextField(
            controller: passController,
            obscureText: true,
            labelText: "Password",
            image: "assets/icons/ic_lock.png",
            errorText: snapshot.hasError ? snapshot.error : null,
          ),
        ),
        Container(
          constraints: BoxConstraints.loose(
            const Size(double.infinity, 40),
          ),
          alignment: AlignmentDirectional.centerEnd,
          child: const Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(
              "Forgot password?",
              style: TextStyle(fontSize: 16, color: Color(0xff606470)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
          child: SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: OnLoginClicked,
              child: const Text(
                "Log In",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  void OnLoginClicked() {
    if (loginBloc.isValidInfo(emailController.text, passController.text)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      print("Error in Login");
    }
  }
}
