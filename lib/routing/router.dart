import 'package:authentication_repository/authentication_repository.dart';
import 'package:bunchup/app/bloc/app_bloc.dart';
import 'package:bunchup/home/home.dart';
import 'package:bunchup/login/view/login.dart';
import 'package:bunchup/routing/go_router_refresh_stream.dart';
import 'package:bunchup/routing/routes.dart';
import 'package:bunchup/sign_up/view/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRouter router(AppBloc appBloc) => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  redirect: _redirect,
  refreshListenable: GoRouterRefreshStream(appBloc.stream),
  routes: [
    GoRoute(path: Routes.home, builder: (context, state) => const HomeScreen()),
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
  final appStatus = BlocProvider.of<AppBloc>(context).state.status;
  final isLoggingIn = state.matchedLocation == Routes.login;
  final isRegistering = state.matchedLocation == Routes.register;

  // Redirect to login if not authenticated
  if (appStatus == AppStatus.unauthenticated && !isLoggingIn && !isRegistering) {
    return '/login';
  }

  // Redirect to home if already logged in and trying to access auth pages
  if (appStatus == AppStatus.authenticated && (isLoggingIn || isRegistering)) {
    return '/';
  }

  // No redirect needed
  return null;
}
