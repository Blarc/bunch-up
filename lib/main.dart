import 'package:bloc/bloc.dart';
import 'package:bunchup/app/bloc_observer.dart';
import 'package:bunchup/firebase_options.dart';
import 'package:bunchup/main_development.dart' as development;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Launch development config by default
  development.main();
}
