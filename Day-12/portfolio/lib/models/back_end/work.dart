// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Work extends Equatable {
  final int workId;
  final String nameType;
  final String nameWork;
  final String imageMainWork;
  final String titleWorkDetail;
  const Work({
    required this.workId,
    required this.nameType,
    required this.nameWork,
    required this.imageMainWork,
    required this.titleWorkDetail,
  });

  @override
  List<Object> get props {
    return [
      workId,
      nameType,
      nameWork,
      imageMainWork,
      titleWorkDetail,
    ];
  }

  Work copyWith({
    int? workId,
    String? nameType,
    String? nameWork,
    String? imageMainWork,
    String? titleWorkDetail,
  }) {
    return Work(
      workId: workId ?? this.workId,
      nameType: nameType ?? this.nameType,
      nameWork: nameWork ?? this.nameWork,
      imageMainWork: imageMainWork ?? this.imageMainWork,
      titleWorkDetail: titleWorkDetail ?? this.titleWorkDetail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'workId': workId,
      'nameType': nameType,
      'nameWork': nameWork,
      'imageMainWork': imageMainWork,
      'titleWorkDetail': titleWorkDetail,
    };
  }

  factory Work.fromMap(Map<String, dynamic> map) {
    return Work(
      workId: map['workId'] as int,
      nameType: map['nameType'] as String,
      nameWork: map['nameWork'] as String,
      imageMainWork: map['imageMainWork'] as String,
      titleWorkDetail: map['titleWorkDetail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Work.fromJson(String source) =>
      Work.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
