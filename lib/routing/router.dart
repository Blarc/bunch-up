import 'package:bunchup/data/repositories/auth/auth_repository_firebase.dart';
import 'package:bunchup/routing/routes.dart';
import 'package:bunchup/ui/auth/login_screen.dart';
import 'package:bunchup/ui/auth/sign_up_screen.dart';
import 'package:bunchup/ui/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter router(AuthRepositoryFirebase authRepository) => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  redirect: _redirect,
  refreshListenable: authRepository,
  routes: [
    GoRoute(path: Routes.home, builder: (context, state) => const ProfileScreen()),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => const SignUpScreen(),
    ),
  ],
);

// From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final isLoggedIn = context.read<AuthRepositoryFirebase>().currentUser != null;
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
