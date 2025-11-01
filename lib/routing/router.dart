import 'package:bunchup/data/repositories/auth/auth_repository.dart';
import 'package:bunchup/routing/routes.dart';
import 'package:bunchup/ui/auth/login.dart';
import 'package:bunchup/ui/auth/register.dart';
import 'package:bunchup/ui/home/home.dart';
import 'package:bunchup/utils/provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter router(BuildContext context) => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  redirect: _redirect,
  refreshListenable: Provider.of<AuthRepository>(context),
  routes: [
    GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
    GoRoute(path: Routes.login, builder: (context, state) => LoginScreen()),
    GoRoute(path: Routes.register, builder: (context, state) => RegisterScreen()),
  ],
);

// From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final isLoggedIn = Provider.of<AuthRepository>(context).currentUser != null;
  final isLoggingIn = state.matchedLocation == '/login';
  final isRegistering = state.matchedLocation == '/register';

  // Redirect to login if not authenticated
  if (!isLoggedIn && !isLoggingIn && !isRegistering) {
    return '/login';
  }

  // Redirect to home if already logged in and trying to access auth pages
  if (isLoggedIn && (isLoggingIn || isRegistering)) {
    return '/';
  }

  // No redirect needed
  return null;
}
