import 'package:bunchup/features/authentication/data/auth_repository_firebase.dart';
import 'package:bunchup/features/authentication/presentation/login.dart';
import 'package:bunchup/features/authentication/presentation/profile.dart';
import 'package:bunchup/features/authentication/presentation/register.dart';
import 'package:bunchup/routing/go_router_refresh_stream.dart';
import 'package:bunchup/routing/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
    redirect: (_, state) => _redirect(authRepository, state),
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
}

// From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
Future<String?> _redirect(
  AuthRepository authRepository,
  GoRouterState state,
) async {
  final isLoggedIn = authRepository.currentUser != null;
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
