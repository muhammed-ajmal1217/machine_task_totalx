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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBY9cs1g0SoSm4BUTdAfZxHe3weiRJWJKA',
    appId: '1:386954282891:web:d2bde7e8e2113d981f118e',
    messagingSenderId: '386954282891',
    projectId: 'phoneauthsample-a67af',
    authDomain: 'phoneauthsample-a67af.firebaseapp.com',
    storageBucket: 'phoneauthsample-a67af.appspot.com',
    measurementId: 'G-C0L78NHV4M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-0wKAYgQ_IY3gEqdHrYGt3ScW25SXv_E',
    appId: '1:386954282891:android:10e0d1ea8d1efd841f118e',
    messagingSenderId: '386954282891',
    projectId: 'phoneauthsample-a67af',
    storageBucket: 'phoneauthsample-a67af.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCS4NGpOErgmyLbF9zwyNBlZOdFSmF0thU',
    appId: '1:386954282891:ios:8dc04091e09691851f118e',
    messagingSenderId: '386954282891',
    projectId: 'phoneauthsample-a67af',
    storageBucket: 'phoneauthsample-a67af.appspot.com',
    iosBundleId: 'com.example.totalx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCS4NGpOErgmyLbF9zwyNBlZOdFSmF0thU',
    appId: '1:386954282891:ios:8dc04091e09691851f118e',
    messagingSenderId: '386954282891',
    projectId: 'phoneauthsample-a67af',
    storageBucket: 'phoneauthsample-a67af.appspot.com',
    iosBundleId: 'com.example.totalx',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBY9cs1g0SoSm4BUTdAfZxHe3weiRJWJKA',
    appId: '1:386954282891:web:ec3f10ea9f61f5fe1f118e',
    messagingSenderId: '386954282891',
    projectId: 'phoneauthsample-a67af',
    authDomain: 'phoneauthsample-a67af.firebaseapp.com',
    storageBucket: 'phoneauthsample-a67af.appspot.com',
    measurementId: 'G-4E6LQLVTX6',
  );
}
