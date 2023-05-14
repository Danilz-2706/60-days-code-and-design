// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String name;
  final String avatar;
  final String slogan;
  final String numberPhone;
  final String emailAddress;
  final String aboutMe;
  const Profile({
    required this.id,
    required this.name,
    required this.avatar,
    required this.slogan,
    required this.numberPhone,
    required this.emailAddress,
    required this.aboutMe,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      avatar,
      slogan,
      numberPhone,
      emailAddress,
      aboutMe,
    ];
  }

  Profile copyWith({
    String? id,
    String? name,
    String? avatar,
    String? slogan,
    String? numberPhone,
    String? emailAddress,
    String? aboutMe,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      slogan: slogan ?? this.slogan,
      numberPhone: numberPhone ?? this.numberPhone,
      emailAddress: emailAddress ?? this.emailAddress,
      aboutMe: aboutMe ?? this.aboutMe,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'avatar': avatar,
      'slogan': slogan,
      'numberPhone': numberPhone,
      'emailAddress': emailAddress,
      'aboutMe': aboutMe,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as String,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
      slogan: map['slogan'] as String,
      numberPhone: map['numberPhone'] as String,
      emailAddress: map['emailAddress'] as String,
      aboutMe: map['aboutMe'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
