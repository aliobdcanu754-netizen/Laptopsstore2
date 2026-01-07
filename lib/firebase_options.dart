// lib/firebase_options.dart
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // If you add Android later, you would add 'case TargetPlatform.android:' here.
    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBjCUWW1_Uy-TLMoWxd5kRF_NwZHcXQlAw',
    appId: '1:499771717810:web:993d94a703b05ba16a71ab',
    messagingSenderId: '499771717810',
    projectId: 'flutter-ai-playground-b5dd1',
    authDomain: 'flutter-ai-playground-b5dd1.firebaseapp.com',
    storageBucket: 'flutter-ai-playground-b5dd1.firebasestorage.app',
  );
}