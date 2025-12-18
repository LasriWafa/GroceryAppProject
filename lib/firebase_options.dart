import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAmQ5zb5cQsiJWlsTlTolYFYVtc01gv374',
    appId: '1:228257846966:web:21a5144c11bbfa35c33817',
    messagingSenderId: '228257846966',
    projectId: 'groceryapp-e9793',
    authDomain: 'groceryapp-e9793.firebaseapp.com',
    storageBucket: 'groceryapp-e9793.firebasestorage.app',
    measurementId: 'G-7BR5ZXTVHD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmQ5zb5cQsiJWlsTlTolYFYVtc01gv374',
    appId: '1:228257846966:web:21a5144c11bbfa35c33817', // Placeholder: using web ID
    messagingSenderId: '228257846966',
    projectId: 'groceryapp-e9793',
    storageBucket: 'groceryapp-e9793.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmQ5zb5cQsiJWlsTlTolYFYVtc01gv374',
    appId: '1:228257846966:web:21a5144c11bbfa35c33817', // Placeholder: using web ID
    messagingSenderId: '228257846966',
    projectId: 'groceryapp-e9793',
    storageBucket: 'groceryapp-e9793.firebasestorage.app',
    iosBundleId: 'com.example.groceryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAmQ5zb5cQsiJWlsTlTolYFYVtc01gv374',
    appId: '1:228257846966:web:21a5144c11bbfa35c33817', // Placeholder: using web ID
    messagingSenderId: '228257846966',
    projectId: 'groceryapp-e9793',
    storageBucket: 'groceryapp-e9793.firebasestorage.app',
    iosBundleId: 'com.example.groceryApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAmQ5zb5cQsiJWlsTlTolYFYVtc01gv374',
    appId: '1:228257846966:web:21a5144c11bbfa35c33817',
    messagingSenderId: '228257846966',
    projectId: 'groceryapp-e9793',
    authDomain: 'groceryapp-e9793.firebaseapp.com',
    storageBucket: 'groceryapp-e9793.firebasestorage.app',
    measurementId: 'G-7BR5ZXTVHD',
  );
}
