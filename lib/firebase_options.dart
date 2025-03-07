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
      //  case TargetPlatform.macOS:
      //   return macos;
      case TargetPlatform.windows:
        return windows;
      /*case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
        */
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDXrXhlRZfRRH6Qhu7eUiCuqxkGcFV1oTI',
    appId: '1:167149215112:web:4296443b1d8c188841ae3d',
    messagingSenderId: '167149215112',
    projectId: 'canteenproject-9f35e',
    authDomain: 'canteenproject-9f35e.firebaseapp.com',
    databaseURL: 'https://canteenproject-9f35e-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'canteenproject-9f35e.appspot.com',
    measurementId: 'G-RZ7T23PC7Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDool-0244HmR_yNDOJYZFsCTCFQNQk2mw',
    appId: '1:167149215112:android:519ced254ae1549841ae3d',
    messagingSenderId: '167149215112',
    projectId: 'canteenproject-9f35e',
    databaseURL: 'https://canteenproject-9f35e-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'canteenproject-9f35e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADAVN4IwBih2v7lVf0oWJQIeDsDC0y6Sc',
    appId: '1:167149215112:ios:5016429b655ba24341ae3d',
    messagingSenderId: '167149215112',
    projectId: 'canteenproject-9f35e',
    databaseURL: 'https://canteenproject-9f35e-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'canteenproject-9f35e.appspot.com',
    iosBundleId: 'com.example.test01',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADAVN4IwBih2v7lVf0oWJQIeDsDC0y6Sc',
    appId: '1:167149215112:ios:5016429b655ba24341ae3d',
    messagingSenderId: '167149215112',
    projectId: 'canteenproject-9f35e',
    databaseURL:
        'https://canteenproject-9f35e-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'canteenproject-9f35e.appspot.com',
    iosBundleId: 'com.example.test01',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDXrXhlRZfRRH6Qhu7eUiCuqxkGcFV1oTI',
    appId: '1:167149215112:web:ba72ba91b547c83041ae3d',
    messagingSenderId: '167149215112',
    projectId: 'canteenproject-9f35e',
    authDomain: 'canteenproject-9f35e.firebaseapp.com',
    databaseURL:
        'https://canteenproject-9f35e-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'canteenproject-9f35e.appspot.com',
    measurementId: 'G-LHMZVVNR9N',
  );
}