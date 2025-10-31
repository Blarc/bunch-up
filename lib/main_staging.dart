import 'package:authentication_repository/authentication_repository.dart';
import 'package:bunchup/app/view/app.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

/// Staging config entry point.
/// Launch with `flutter run --target lib/main_staging.dart`.
void main() async {
  Logger.root.level = Level.ALL;
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(App(authenticationRepository: authenticationRepository));
}
