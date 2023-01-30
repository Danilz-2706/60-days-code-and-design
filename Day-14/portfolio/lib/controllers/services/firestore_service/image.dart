import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages, library_prefixes
import 'package:path/path.dart' as Path;

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

  Future<List<String>> getImage({required String folderName}) async {
    List<String> storyUrl = [];
    final ref = storage.ref().child('image_profile/$folderName');
    final listResult = await ref.listAll();
    for (var item in listResult.items) {
      var x = await item.getDownloadURL();
      storyUrl.add(x);
    }
    return storyUrl;
  }
}
