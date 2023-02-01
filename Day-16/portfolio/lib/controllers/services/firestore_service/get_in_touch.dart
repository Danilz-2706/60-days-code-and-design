import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../models/back_end/get_in_touch.dart';

class GetInTouchService {
  final _getInTouchService =
      FirebaseFirestore.instance.collection("get-in-touch");

  Future<void> create({required GetInTouch getInTouch}) async {
    try {
      final docUser = _getInTouchService.doc();
      // ignore: prefer_const_constructors
      final getin = GetInTouch(number: 1, text: '');
      final json = getin.toMap();
      await docUser.set(json);
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error: '${e.code}': '${e.message}'");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<GetInTouch>> getInTouch() async {
    final List<GetInTouch> workgetInTouch = [];
    try {
      final getInTouch = await _getInTouchService.get();
      // ignore: avoid_function_literals_in_foreach_calls
      getInTouch.docs.forEach((element) {
        return workgetInTouch.add(GetInTouch.fromMap(element.data()));
      });
      workgetInTouch.sort((a, b) => a.number.compareTo(b.number));
      return workgetInTouch;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error: '${e.code}': '${e.message}'");
      }
      return workgetInTouch;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
