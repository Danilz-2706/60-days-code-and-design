import 'package:flutter/material.dart';

import '../../constans/responsive.dart';

class PageItem extends StatelessWidget {
  const PageItem({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Hero(
        tag: "assets/images/avatar.png",
        child: GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(MyResponsive.isMobile(context)
                ? 4
                : MyResponsive.isDesktop(context)
                    ? 20
                    : 8),
            decoration: BoxDecoration(
              color: pageIndex == 3 ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage("assets/images/avatar.png"),
                  fit: BoxFit.fill),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 4), blurRadius: 4, color: Colors.black26)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
