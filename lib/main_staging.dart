import 'package:bunchup/config/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'main.dart';

/// Staging config entry point.
/// Launch with `flutter run --target lib/main_staging.dart`.
void main() {
  Logger.root.level = Level.ALL;
  runApp(MultiProvider(providers: providersStaging, child: const MainApp()));
}