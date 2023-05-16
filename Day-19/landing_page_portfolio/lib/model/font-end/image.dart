// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ImageFE {
  final String? source;
  final String? size;

  ImageFE({required this.source, this.size});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source,
      'size': size,
    };
  }

  factory ImageFE.fromMap(Map<String, dynamic> map) {
    return ImageFE(
      source: map['source'] != null ? map['source'] as String : null,
      size: map['size'] != null ? map['size'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageFE.fromJson(String source) =>
      ImageFE.fromMap(json.decode(source) as Map<String, dynamic>);
}
