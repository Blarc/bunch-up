import 'package:bunchup/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

/// Staging config entry point.
/// Launch with `flutter run --target lib/main_staging.dart`.
void main() {
  Logger.root.level = Level.ALL;
  runApp(const ProviderScope(child: MainApp()));
}
