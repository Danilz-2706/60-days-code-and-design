// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ImageVideo {
  final String source;
  final String name;
  final String type;
  final String uploadDate;

  ImageVideo({
    required this.source,
    required this.name,
    required this.type,
    required this.uploadDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source,
      'name': name,
      'type': type,
      'uploadDate': uploadDate,
    };
  }

  factory ImageVideo.fromMap(Map<String, dynamic> map) {
    return ImageVideo(
      source: map['source'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      uploadDate: map['uploadDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageVideo.fromJson(String source) =>
      ImageVideo.fromMap(json.decode(source) as Map<String, dynamic>);

  ImageVideo copyWith({
    String? source,
    String? name,
    String? type,
    String? uploadDate,
  }) {
    return ImageVideo(
      source: source ?? this.source,
      name: name ?? this.name,
      type: type ?? this.type,
      uploadDate: uploadDate ?? this.uploadDate,
    );
  }

  @override
  String toString() {
    return 'ImageFE(source: $source, name: $name, type: $type, uploadDate: $uploadDate)';
  }
}
