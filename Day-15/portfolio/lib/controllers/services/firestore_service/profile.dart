import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../models/back_end/profile.dart';

class ProfileService {
  final _profileService = FirebaseFirestore.instance.collection("profile");

  Future<void> create({required Profile profile}) async {
    try {
      final docUser = _profileService.doc("main-user");
      // ignore: prefer_const_constructors
      final user = Profile(
        id: "main-user",
        name: "Danilz",
        avatar: "avatar",
        slogan: "slogan",
        numberPhone: "0708391537",
        emailAddress: "tandat27062000@gmail.com",
        aboutMe: "aboutMe",
        images: const [],
      );
      final json = user.toMap();
      await docUser.set(json);
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error: '${e.code}': '${e.message}'");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Profile?> getProfile() async {
    try {
      final Profile profile;

      final getProfile = await _profileService.doc("main-user").get();
      if (getProfile.exists) {
        profile = Profile.fromMap(getProfile.data()!);

        if (kDebugMode) {
          print(profile);
        }
        return profile;
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
