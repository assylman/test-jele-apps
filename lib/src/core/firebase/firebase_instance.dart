import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

abstract class FirebaseInstance {
  static Future<void> init(FirebaseOptions firebaseOptions) async {
    try {
      await Firebase.initializeApp(
        options: firebaseOptions,
      );
    } catch (e) {
      debugPrint('Failed to init firebase: $e');
    }
  }
}
