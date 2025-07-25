// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBY4fkZk-mcguWX5TsvQ5pTAJD9L6Ayqik',
    appId: '1:56867130184:web:182bb5724622a02697017d',
    messagingSenderId: '56867130184',
    projectId: 'study-planner-best',
    authDomain: 'study-planner-best.firebaseapp.com',
    storageBucket: 'study-planner-best.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBI6KEUK_pQ1vtrMBX5YzwVFDujIzS3Wo',
    appId: '1:56867130184:android:fa619511b9d360b697017d',
    messagingSenderId: '56867130184',
    projectId: 'study-planner-best',
    storageBucket: 'study-planner-best.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyALBhDK_sqoYeuh6A7wROoM2O0J2FRSMz8',
    appId: '1:56867130184:ios:3c0f123da23776c497017d',
    messagingSenderId: '56867130184',
    projectId: 'study-planner-best',
    storageBucket: 'study-planner-best.firebasestorage.app',
    iosBundleId: 'com.example.studyPlannerNew',
  );
}
