import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/models/back_end/process.dart';

import '../../../models/back_end/work.dart';

class ProcessService {
  final _profileService = FirebaseFirestore.instance.collection("process");

  Future<void> create({required Process process}) async {
    try {
      final docWork = _profileService.doc();
      // ignore: prefer_const_constructors
      // final process = Process(
      //   workId: workId,
      //   number: 2,
      //   typeProcess: "${TypeProcess.step}",
      //   nameStep: "Steps 1:",
      //   contentStep: "Check my step",
      // );
      final json = process.toMap();
      await docWork.set(json);
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error: '${e.code}': '${e.message}'");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Process?>?> getAllProcess({required String workId}) async {
    final List<Process?> processList = [];
    try {
      final process = await _profileService.get();
      // ignore: avoid_function_literals_in_foreach_calls
      process.docs.forEach((element) {
        if (element.data()['workId'].toString() == workId) {
          return processList.add(Process.fromMap(element.data()));
        }
      });

      return processList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error: '${e.code}': '${e.message}'");
      }
      return processList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
