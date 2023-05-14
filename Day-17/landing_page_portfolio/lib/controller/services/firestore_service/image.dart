import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages, library_prefixes
import 'package:path/path.dart' as Path;

import '../../../model/font-end/image.dart';

class ImageService {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadFile(PickedFile? pickedFile) async {
    try {
      final ref = storage
          .ref()
          .child('image_profile/main-user/${Path.basename(pickedFile!.path)}');
      final uploadTask = await ref.putData(await pickedFile.readAsBytes());
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      // ignore: avoid_print
      print('error occured');
    }
    return "";
  }

  Future<List<ImageFE>> getImage(
      {required String folderName, List<String>? size}) async {
    List<ImageFE> storyUrl = [];
    try {
      if (size != null) {
        for (var i in size) {
          final ref = storage.ref().child('image_profile/$folderName/$i');
          final listResult = await ref.listAll();
          for (var item in listResult.items) {
            var source = await item.getDownloadURL();
            storyUrl.add(ImageFE(source: source, size: i));
          }
        }

        return storyUrl;
      } else {
        final ref = storage.ref().child('image_profile/$folderName');
        final listResult = await ref.listAll();
        for (var item in listResult.items) {
          var source = await item.getDownloadURL();
          storyUrl.add(ImageFE(source: source));
        }
        return storyUrl;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Get Image');
      }
      return [];
    }
  }
}
