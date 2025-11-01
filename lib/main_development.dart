import 'package:bunchup/data/repositories/auth/auth_repository.dart';
import 'package:bunchup/main.dart';
import 'package:bunchup/utils/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

/// Development config entry point.
/// Launch with `flutter run --target lib/main_development.dart`.
void main() async {
  Logger.root.level = Level.ALL;
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(
    Provider(
      notifier: AuthRepository(),
      child: const MainApp(),
    )
  );
}
