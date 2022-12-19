import 'package:flutter/material.dart';
import 'package:portfolio/views/constans/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 7783;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 9 * fem, 0 * fem),
                width: 50 * fem,
                height: 50 * fem,
                decoration: const BoxDecoration(
                  gradient: kPrimaryColor,
                ),
              ),
              Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 3 * fem, 348 * fem, 0 * fem),
                child: Text(
                  'Danilz Dinh',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),
          Row(),
          Row(),
          Row(),
        ],
      ),
    );
  }
}
