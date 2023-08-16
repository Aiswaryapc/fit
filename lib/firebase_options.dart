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
    apiKey: 'AIzaSyBVU9eE3tymQENsJV14Kon9ZP1kuHTbxhs',
    appId: '1:785670782112:web:e030c78294a473c6a39dc5',
    messagingSenderId: '785670782112',
    projectId: 'fitness-1d7d9',
    authDomain: 'fitness-1d7d9.firebaseapp.com',
    storageBucket: 'fitness-1d7d9.appspot.com',
    measurementId: 'G-XGNJSN69C0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjYEdacKm_RRF0_DEB2sq3AfkQpD_5-qM',
    appId: '1:785670782112:android:9a2dd105c74852cca39dc5',
    messagingSenderId: '785670782112',
    projectId: 'fitness-1d7d9',
    storageBucket: 'fitness-1d7d9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCuFWb99T1E-zdSeYcOACDSsvD1l6EdE0',
    appId: '1:785670782112:ios:7cbf5ea8c0dc2db7a39dc5',
    messagingSenderId: '785670782112',
    projectId: 'fitness-1d7d9',
    storageBucket: 'fitness-1d7d9.appspot.com',
    iosClientId: '785670782112-8jp6dkcef1hvf38tghecgv8jhf4bfilb.apps.googleusercontent.com',
    iosBundleId: 'com.example.fit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCuFWb99T1E-zdSeYcOACDSsvD1l6EdE0',
    appId: '1:785670782112:ios:7cbf5ea8c0dc2db7a39dc5',
    messagingSenderId: '785670782112',
    projectId: 'fitness-1d7d9',
    storageBucket: 'fitness-1d7d9.appspot.com',
    iosClientId: '785670782112-8jp6dkcef1hvf38tghecgv8jhf4bfilb.apps.googleusercontent.com',
    iosBundleId: 'com.example.fit',
  );
}