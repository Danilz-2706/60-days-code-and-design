// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String name;
  final String numberPhone;
  final String emailAddress;
  final String aboutMe;
  final List<String> images;
  const Profile({
    required this.name,
    required this.numberPhone,
    required this.emailAddress,
    required this.aboutMe,
    required this.images,
  });

  @override
  List<Object> get props {
    return [
      name,
      numberPhone,
      emailAddress,
      aboutMe,
      images,
    ];
  }

  Profile copyWith({
    String? name,
    String? numberPhone,
    String? emailAddress,
    String? aboutMe,
    List<String>? images,
  }) {
    return Profile(
      name: name ?? this.name,
      numberPhone: numberPhone ?? this.numberPhone,
      emailAddress: emailAddress ?? this.emailAddress,
      aboutMe: aboutMe ?? this.aboutMe,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'numberPhone': numberPhone,
      'emailAddress': emailAddress,
      'aboutMe': aboutMe,
      'images': images,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map['name'] as String,
      numberPhone: map['numberPhone'] as String,
      emailAddress: map['emailAddress'] as String,
      aboutMe: map['aboutMe'] as String,
      images: List<String>.from(
        (map['images'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
