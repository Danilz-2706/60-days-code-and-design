// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Step extends Equatable {
  final String processId;
  final String title;
  final String container;
  final String? image;
  const Step({
    required this.processId,
    required this.title,
    required this.container,
    this.image,
  });

  Step copyWith({
    String? processId,
    String? title,
    String? container,
    String? image,
  }) {
    return Step(
      processId: processId ?? this.processId,
      title: title ?? this.title,
      container: container ?? this.container,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'processId': processId,
      'title': title,
      'container': container,
      'image': image,
    };
  }

  factory Step.fromMap(Map<String, dynamic> map) {
    return Step(
      processId: map['processId'] as String,
      title: map['title'] as String,
      container: map['container'] as String,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Step.fromJson(String source) =>
      Step.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Step(title: $title, container: $container, image: $image)';

  @override
  List<Object?> get props => [processId, title, container, image];

  @override
  bool get stringify => true;
}
