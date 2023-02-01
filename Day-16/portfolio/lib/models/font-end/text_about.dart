// ignore_for_file: public_member_api_docs, sort_constructors_first
enum Heading {
  text,
  header,
}

class TextAbout {
  final Heading heading;
  final String? header, text;
  final double? myFontsize;
  TextAbout({
    required this.heading,
    this.header,
    this.text,
    this.myFontsize,
  });
}
