import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../models/back_end/work.dart';

class WorkService {
  final _profileService = FirebaseFirestore.instance.collection("works");

  Future<void> create({required Work work}) async {
    try {
      final docWork = _profileService.doc();
      // ignore: prefer_const_constructors
      final work = Work(
        workId: docWork.id,
        nameType: "${TypeApp.ios}",
        nameWork: "MyPortfolio",
        imageMainWork: "",
        titleWorkDetail: "Design and create my website",
      );
      final json = work.toMap();
      await docWork.set(json);
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error: '${e.code}': '${e.message}'");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Work>> getAllWork() async {
    final List<Work> workList = [];
    try {
      final work = await _profileService.get();
      // ignore: avoid_function_literals_in_foreach_calls
      work.docs.forEach((element) {
        return workList.add(Work.fromMap(element.data()));
      });

      return workList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error: '${e.code}': '${e.message}'");
      }
      return workList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Work?> getOnlyWork({required String workId}) async {
    try {
      final Work work;

      final getWork = await _profileService.doc(workId).get();
      if (getWork.exists) {
        work = Work.fromMap(getWork.data()!);
        if (kDebugMode) {
          print(work);
        }
        return work;
      }
      return null;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error: '${e.code}': '${e.message}'");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }
}
