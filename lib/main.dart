import 'package:bunchup/src/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Only use emulator in debug mode
  if (kDebugMode) {
    await FirebaseAuth.instance.useAuthEmulator("localhost", 9099);
  }
  runApp(const Bunchup());
}
