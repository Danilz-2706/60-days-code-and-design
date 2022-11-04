import 'package:flutter/material.dart';

class FooterLoginScreen extends StatelessWidget {
  const FooterLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: RichText(
        text: const TextSpan(
            text: "New user? ",
            style: TextStyle(color: Color(0xff606470), fontSize: 16),
            children: <TextSpan>[
              TextSpan(
                  // recognizer: TapGestureRecognizer()
                  //   ..onTap = () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) =>
                  //                 RegisterScreen()));
                  //   },
                  text: "Sign up for a new account",
                  style: TextStyle(color: Color(0xff3277D8), fontSize: 16))
            ]),
      ),
    );
  }
}
