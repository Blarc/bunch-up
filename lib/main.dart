import 'package:bunchup/firebase_options.dart';
import 'package:bunchup/main_development.dart' as development;
import 'package:bunchup/routing/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Launch development config by default
  development.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // localizationsDelegates: [
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   AppLocalizationDelegate(),
      // ],
      // scrollBehavior: AppCustomScrollBehavior(),
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      routerConfig: router(context),
    );
  }
}
