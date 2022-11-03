class Product {
  final String title, country, image;
  final int price;
  final bool rate;
  Product(
    this.title,
    this.country,
    this.image,
    this.price,
    this.rate,
  );
}

var fakedata = [
  Product("cannabis", "vietnam", "assets/images/image_1.png", 400, true),
  Product("cactus", "america", "assets/images/image_2.png", 500, true),
  Product("tiger tongue", "england", "assets/images/image_3.png", 600, true),
  Product("cannabis", "brazil", "assets/images/image_1.png", 700, true),
  Product("cannabis", "brazil", "assets/images/bottom_img_1.png", 700, false),
  Product("cannabis", "brazil", "assets/images/bottom_img_2.png", 700, false),
];
