import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

import 'main.dart';

/// Development config entry point.
/// Launch with `flutter run --target lib/main_development.dart`.
void main() async {
  Logger.root.level = Level.ALL;
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(ProviderScope(child: MainApp()));
}
