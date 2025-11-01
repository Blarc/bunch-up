import 'package:bunchup/data/repositories/auth/auth_repository.dart';
import 'package:bunchup/main.dart';
import 'package:bunchup/utils/provider.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

/// Staging config entry point.
/// Launch with `flutter run --target lib/main_staging.dart`.
void main() {
  Logger.root.level = Level.ALL;
  runApp(
      Provider(
        notifier: AuthRepository(),
        child: const MainApp(),
      )
  );
}
