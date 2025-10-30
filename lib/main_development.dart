import 'package:bunchup/config/dependencies.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'main.dart';

/// Development config entry point.
/// Launch with `flutter run --target lib/main_development.dart`.
void main() async {
  Logger.root.level = Level.ALL;
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(MultiProvider(providers: providersLocal, child: const MainApp()));
}