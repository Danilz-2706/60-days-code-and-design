import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: must_be_immutable
class TaskModel extends Equatable {
  final String title;
  final String id;
  bool? isDone;
  bool? isDeleted;

  TaskModel({
    required this.title,
    required this.id,
    this.isDone,
    this.isDeleted,
  }) {
    isDeleted = isDeleted ?? false;
    isDone = isDone ?? false;
  }

  TaskModel copyWith({
    String? title,
    String? id,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TaskModel(
      title: title ?? this.title,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      id: map['id'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [title, id, isDone, isDeleted];
}
