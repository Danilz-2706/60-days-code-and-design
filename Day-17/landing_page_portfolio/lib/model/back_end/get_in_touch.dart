// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class GetInTouch extends Equatable {
  final String text;
  final int number;
  const GetInTouch({
    required this.text,
    required this.number,
  });

  @override
  List<Object> get props => [text, number];

  GetInTouch copyWith({
    String? text,
    int? number,
  }) {
    return GetInTouch(
      text: text ?? this.text,
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'number': number,
    };
  }

  factory GetInTouch.fromMap(Map<String, dynamic> map) {
    return GetInTouch(
      text: map['text'] as String,
      number: map['number'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetInTouch.fromJson(String source) =>
      GetInTouch.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
