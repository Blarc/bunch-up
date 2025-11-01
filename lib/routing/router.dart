import 'package:bunchup/routing/routes.dart';
import 'package:bunchup/ui/auth/login_screen.dart';
import 'package:bunchup/ui/auth/sign_up_form_screen.dart';
import 'package:bunchup/ui/auth/sign_up_screen.dart';
import 'package:bunchup/ui/profile/profile.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter();

  GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.login,
    debugLogDiagnostics: true,
    // redirect: _redirect,
    // refreshListenable: authRepository,
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
        path: Routes.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: Routes.signUpForm,
        builder: (context, state) => const SignUpFormScreen(),
      ),
    ],
    routerNeglect: true,
  );

  // // From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
  // Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  //   final isLoggedIn = context.read<AuthRepositoryFirebase>().currentUser != null;
  //
  //   final isLoggingIn = state.matchedLocation == Routes.login;
  //   final isSignUp = state.matchedLocation == Routes.signUp;
  //   final isSignUpForm = state.matchedLocation == Routes.signUpForm;
  //
  //   // Redirect to login if not authenticated
  //   // TODO(blarc): Improve this somehow
  //   if (!isLoggedIn && !isLoggingIn && !isSignUp && !isSignUpForm) {
  //     return Routes.login;
  //   }
  //
  //   // Redirect to home if already logged in and trying to access auth pages
  //   // TODO(blarc): Improve this somehow
  //   if (isLoggedIn && (isLoggingIn || isSignUp || isSignUpForm)) {
  //     return Routes.home;
  //   }
  //
  //   // No redirect needed
  //   return null;
  // }
}
