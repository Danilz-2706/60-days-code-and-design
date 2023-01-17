// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:portfolio/models/back_end/step.dart';

class Process extends Equatable {
  final String workId;
  final String processId;
  final int no;
  final List<Step> listStep;
  const Process({
    required this.workId,
    required this.processId,
    required this.no,
    required this.listStep,
  });

  @override
  List<Object> get props => [workId, processId, no, listStep];

  Process copyWith({
    String? workId,
    String? processId,
    int? no,
    List<Step>? listStep,
  }) {
    return Process(
      workId: workId ?? this.workId,
      processId: processId ?? this.processId,
      no: no ?? this.no,
      listStep: listStep ?? this.listStep,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'workId': workId,
      'processId': processId,
      'no': no,
      'listStep': listStep.map((x) => x.toMap()).toList(),
    };
  }

  factory Process.fromMap(Map<String, dynamic> map) {
    return Process(
      workId: map['workId'] as String,
      processId: map['processId'] as String,
      no: map['no'] as int,
      listStep: List<Step>.from(
        (map['listStep'] as List<int>).map<Step>(
          (x) => Step.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Process.fromJson(String source) =>
      Process.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
