// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBJqidk6sggACIfnFlciEbCC08BMg4DJjg',
    appId: '1:975507745859:web:ac925e437c5340c8bdf8f6',
    messagingSenderId: '975507745859',
    projectId: 'my-portfolio-ac4c6',
    authDomain: 'my-portfolio-ac4c6.firebaseapp.com',
    storageBucket: 'my-portfolio-ac4c6.appspot.com',
    measurementId: 'G-69Q98KB0ZV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKxbQfnzqu7KvyqD5M8PyoDg9hJD4pkBI',
    appId: '1:975507745859:android:b8f44641aeca7206bdf8f6',
    messagingSenderId: '975507745859',
    projectId: 'my-portfolio-ac4c6',
    storageBucket: 'my-portfolio-ac4c6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxu_EKa6a7l0Z1qE_FIKWN5LZ2VqGrHPE',
    appId: '1:975507745859:ios:50eb28eac9022026bdf8f6',
    messagingSenderId: '975507745859',
    projectId: 'my-portfolio-ac4c6',
    storageBucket: 'my-portfolio-ac4c6.appspot.com',
    iosClientId: '975507745859-ai5buth5aak19fhf6j1jdi2agg4t5k3q.apps.googleusercontent.com',
    iosBundleId: 'com.example.portfolio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCxu_EKa6a7l0Z1qE_FIKWN5LZ2VqGrHPE',
    appId: '1:975507745859:ios:50eb28eac9022026bdf8f6',
    messagingSenderId: '975507745859',
    projectId: 'my-portfolio-ac4c6',
    storageBucket: 'my-portfolio-ac4c6.appspot.com',
    iosClientId: '975507745859-ai5buth5aak19fhf6j1jdi2agg4t5k3q.apps.googleusercontent.com',
    iosBundleId: 'com.example.portfolio',
  );
}
