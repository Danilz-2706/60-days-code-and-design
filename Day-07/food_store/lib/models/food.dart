import 'package:flutter/material.dart';

class Food {
  final String name, image;
  final int price, remainAmount;

  Food(this.name, this.price, this.remainAmount, this.image);
}

class Menu {
  final String title;
  final IconData icon;
  Menu(this.title, this.icon);
}

class Filter {
  final String title, icon;
  Filter(this.title, this.icon);
}

var fakeData = [
  Food("Original Burger", 20, 10, "assets/images/1.png"),
  Food("Double Burger", 20, 10, "assets/images/2.png"),
  Food("Cheese Burger", 20, 10, "assets/images/3.png"),
  Food("Double Cheese Burger", 20, 10, "assets/images/4.png"),
  Food("Spicy Burger", 20, 10, "assets/images/5.png"),
  Food("Special Black Burger", 20, 10, "assets/images/6.png"),
  Food("Special Cheese Burger", 20, 10, "assets/images/7.png"),
  Food("Jumbo Cheese Burger", 20, 10, "assets/images/8.png"),
  Food("Spicy Burger", 20, 10, "assets/images/9.png"),
  Food("Special Black Burger", 20, 10, "assets/images/10.png"),
  Food("Special Cheese Burger", 20, 10, "assets/images/11.png"),
  Food("Jumbo Cheese Burger", 20, 10, "assets/images/12.png"),
  Food("Jumbo Cheese Burger", 20, 10, "assets/images/12.png"),
];

var fakeDataMenu = [
  Menu("Home", Icons.rocket_sharp),
  Menu("Menu", Icons.format_list_bulleted_rounded),
  Menu("History", Icons.history_toggle_off_rounded),
  Menu("Promos", Icons.discount_outlined),
  Menu("Settings", Icons.sports_soccer_outlined),
];

var fakeDataFilter = [
  Filter("Burger", "assets/icons/icon-burger.png"),
  Filter("Noodles", "assets/icons/icon-noodles.png"),
  Filter("Drinks", "assets/icons/icon-drinks.png"),
  Filter("Desserts", "assets/icons/icon-desserts.png"),
];
