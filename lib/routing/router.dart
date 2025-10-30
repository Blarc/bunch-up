import 'package:bunchup/data/repositories/auth/auth_repository_firebase.dart';
import 'package:bunchup/routing/routes.dart';
import 'package:bunchup/ui/auth/login.dart';
import 'package:bunchup/ui/auth/register.dart';
import 'package:bunchup/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter router(AuthRepositoryFirebase authRepository) => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  redirect: _redirect,
  refreshListenable: authRepository,
  routes: [
    GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
    GoRoute(path: Routes.login, builder: (context, state) => LoginScreen()),
    GoRoute(path: Routes.register, builder: (context, state) => RegisterScreen()),
  ],
);

// From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  // if the user is not logged in, they need to login
  final loggedIn = context.read<AuthRepositoryFirebase>().currentUser != null;
  final loggingIn = state.matchedLocation == Routes.login;
  if (!loggedIn) {
    return Routes.login;
  }

  // if the user is logged in but still on the login page, send them to
  // the home page
  if (loggingIn) {
    return Routes.home;
  }

  // no need to redirect at all
  return null;
}
