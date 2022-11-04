import 'package:flutter/material.dart';

class HeaderLoginScreen extends StatelessWidget {
  const HeaderLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 140,
        ),
        Image.asset('assets/icons/ic_car_green.png'),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 6),
          child: Text(
            "Welcome back!",
            style: TextStyle(fontSize: 22, color: Color(0xff333333)),
          ),
        ),
        const Text(
          "Login to continue using iCab",
          style: TextStyle(fontSize: 16, color: Color(0xff606470)),
        ),
      ],
    );
  }
}
