// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

enum TypeProcess {
  step,
  image,
  video,
  title,
  detailProcess,
}

class Process extends Equatable {
  final String workId;
  final int number;
  final String typeProcess;
  final String? nameTitle;
  final String? nameStep;
  final String? contentStep;
  final String? image;
  final String? video;
  final String? linkDetailProcess;
  const Process({
    required this.workId,
    required this.number,
    required this.typeProcess,
    this.nameTitle,
    this.nameStep,
    this.contentStep,
    this.image,
    this.video,
    this.linkDetailProcess,
  });

  @override
  List<Object?> get props {
    return [
      workId,
      number,
      typeProcess,
      nameTitle,
      nameStep,
      contentStep,
      image,
      video,
      linkDetailProcess,
    ];
  }

  Process copyWith({
    String? workId,
    int? number,
    String? typeProcess,
    String? nameTitle,
    String? nameStep,
    String? contentStep,
    String? image,
    String? video,
    String? linkDetailProcess,
  }) {
    return Process(
      workId: workId ?? this.workId,
      number: number ?? this.number,
      typeProcess: typeProcess ?? this.typeProcess,
      nameTitle: nameTitle ?? this.nameTitle,
      nameStep: nameStep ?? this.nameStep,
      contentStep: contentStep ?? this.contentStep,
      image: image ?? this.image,
      video: video ?? this.video,
      linkDetailProcess: linkDetailProcess ?? this.linkDetailProcess,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'workId': workId,
      'number': number,
      'typeProcess': typeProcess,
      'nameTitle': nameTitle,
      'nameStep': nameStep,
      'contentStep': contentStep,
      'image': image,
      'video': video,
      'linkDetailProcess': linkDetailProcess,
    };
  }

  factory Process.fromMap(Map<String, dynamic> map) {
    return Process(
      workId: map['workId'] as String,
      number: map['number'] as int,
      typeProcess: map['typeProcess'] as String,
      nameTitle: map['nameTitle'] != null ? map['nameTitle'] as String : null,
      nameStep: map['nameStep'] != null ? map['nameStep'] as String : null,
      contentStep:
          map['contentStep'] != null ? map['contentStep'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      video: map['video'] != null ? map['video'] as String : null,
      linkDetailProcess: map['linkDetailProcess'] != null
          ? map['linkDetailProcess'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Process.fromJson(String source) =>
      Process.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
