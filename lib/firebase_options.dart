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
    apiKey: 'AIzaSyC9mDpBHK21F9L59KWkyIBeeQ8sRWkfW18',
    appId: '1:214923502000:web:538e80d9c41fb4db777675',
    messagingSenderId: '214923502000',
    projectId: 'cookoffpro',
    authDomain: 'cookoffpro.firebaseapp.com',
    storageBucket: 'cookoffpro.appspot.com',
    measurementId: 'G-XRL902GNFE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoT8kG2MY4Xq5pPy4-620hnRT3JD4ZXmw',
    appId: '1:214923502000:android:184f94072566343f777675',
    messagingSenderId: '214923502000',
    projectId: 'cookoffpro',
    storageBucket: 'cookoffpro.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBuplWsVlQ8yHhUt-M6WFGjSb5ipjExqmc',
    appId: '1:214923502000:ios:9f3d17451eca3154777675',
    messagingSenderId: '214923502000',
    projectId: 'cookoffpro',
    storageBucket: 'cookoffpro.appspot.com',
    iosBundleId: 'dev.clawworks.cookOffPro',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBuplWsVlQ8yHhUt-M6WFGjSb5ipjExqmc',
    appId: '1:214923502000:ios:9f3d17451eca3154777675',
    messagingSenderId: '214923502000',
    projectId: 'cookoffpro',
    storageBucket: 'cookoffpro.appspot.com',
    iosBundleId: 'dev.clawworks.cookOffPro',
  );

}