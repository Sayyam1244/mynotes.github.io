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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDP4yCquBm3IIpdnpscjBVQGqBbGQpKv3o',
    appId: '1:307722772777:android:bbfa39039a9a01cad4d738',
    messagingSenderId: '307722772777',
    projectId: 'mynotes-firebasetest-project',
    storageBucket: 'mynotes-firebasetest-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAgtKT_SNfM6VUbxD7nTvfQVA99g_Gljk',
    appId: '1:307722772777:ios:1bf9b66af4eb19ffd4d738',
    messagingSenderId: '307722772777',
    projectId: 'mynotes-firebasetest-project',
    storageBucket: 'mynotes-firebasetest-project.appspot.com',
    iosClientId: '307722772777-21v7bv6gt8uop67ca3lj0tj2657nr4lb.apps.googleusercontent.com',
    iosBundleId: 'com.fluttery.mynotes',
  );
}