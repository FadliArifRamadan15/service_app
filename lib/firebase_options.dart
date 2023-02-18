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
    apiKey: 'AIzaSyCJrMchwZi22wqti8b6XKMYBZ5GSQoIXDI',
    appId: '1:49132008493:web:3f9b9f8c588c7c687c74a4',
    messagingSenderId: '49132008493',
    projectId: 'kelompok-004',
    authDomain: 'kelompok-004.firebaseapp.com',
    storageBucket: 'kelompok-004.appspot.com',
    measurementId: 'G-WY5G917TK8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCS6xA4-sHtWgvWrpu_q_9MtKdYDnHn-Es',
    appId: '1:49132008493:android:4214653c89bc946c7c74a4',
    messagingSenderId: '49132008493',
    projectId: 'kelompok-004',
    storageBucket: 'kelompok-004.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD39Uzz9D_RnwNpArpHNZHvL5CXHehPPlA',
    appId: '1:49132008493:ios:98410ae390940e2a7c74a4',
    messagingSenderId: '49132008493',
    projectId: 'kelompok-004',
    storageBucket: 'kelompok-004.appspot.com',
    androidClientId: '49132008493-crtdrihu6m21i7l899kunhrulsnojj4k.apps.googleusercontent.com',
    iosClientId: '49132008493-8jleb3kra1h7jms5ji60ipje2fjo6ku1.apps.googleusercontent.com',
    iosBundleId: 'com.example.serviceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD39Uzz9D_RnwNpArpHNZHvL5CXHehPPlA',
    appId: '1:49132008493:ios:98410ae390940e2a7c74a4',
    messagingSenderId: '49132008493',
    projectId: 'kelompok-004',
    storageBucket: 'kelompok-004.appspot.com',
    androidClientId: '49132008493-crtdrihu6m21i7l899kunhrulsnojj4k.apps.googleusercontent.com',
    iosClientId: '49132008493-8jleb3kra1h7jms5ji60ipje2fjo6ku1.apps.googleusercontent.com',
    iosBundleId: 'com.example.serviceApp',
  );
}