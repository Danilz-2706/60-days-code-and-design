import 'package:flutter/material.dart';

class ItemSideBar extends StatelessWidget {
  const ItemSideBar({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
    this.pressed = false,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;
  final bool pressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: press,
          child: Container(
            alignment: Alignment.center,
            height: 92,
            width: 68,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              color: pressed == true ? Colors.orange : Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: pressed == true ? Colors.white : Colors.black,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: pressed == true ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
