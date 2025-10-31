import 'package:authentication_repository/authentication_repository.dart';
import 'package:bunchup/app/view/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

/// Development config entry point.
/// Launch with `flutter run --target lib/main_development.dart`.
void main() async {
  Logger.root.level = Level.ALL;
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(App(authenticationRepository: authenticationRepository));
}
