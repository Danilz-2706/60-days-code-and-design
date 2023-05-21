import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constans/colors.dart';

class ConnectWithMe extends StatelessWidget {
  const ConnectWithMe({
    super.key,
    required this.title,
    required this.press,
    required this.name,
    required this.check,
  });

  final String title;
  final String name;
  final bool check;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title: ",
          style: const TextStyle(
            fontSize: 18,
            color: kTextColor,
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: press,
            child: Text(
              name,
              style: TextStyle(
                  fontSize: 18,
                  color: kTextColor,
                  decoration: check ? TextDecoration.underline : null),
            ),
          ),
        ),
        if (!check) const SizedBox(height: 40),
        if (check)
          Tooltip(
            message: "Copy",
            child: IconButton(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: name));
              },
              icon: const Icon(
                Icons.copy_all,
                color: kTextColor,
              ),
            ),
          ),
      ],
    );
  }
}
