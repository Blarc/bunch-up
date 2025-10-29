import 'package:bunchup/src/auth.dart';
import 'package:bunchup/src/screens/home.dart';
import 'package:bunchup/src/screens/login.dart';
import 'package:bunchup/src/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Bunchup extends StatelessWidget {
  const Bunchup({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BunchupAuth(),
      child: const BunchupRouter(),
    );
  }
}

class BunchupRouter extends StatelessWidget {
  const BunchupRouter({super.key});

  @override
  Widget build(BuildContext context) {
    // listen=false so the widget is not rebuild everytime auth changes
    // refreshListenable in GoRouter takes care of auth changes
    final auth = Provider.of<BunchupAuth>(context, listen: false);

    return MaterialApp.router(
      routerConfig: GoRouter(
        refreshListenable: auth,
        redirect: (context, state) {
          final isLoggedIn = auth.currentUser != null;
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
        },
        routes: [
          GoRoute(
            path: '/login',
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: '/register',
            builder: (context, state) => const RegisterScreen(),
          ),
          GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        ],
      ),
    );
  }
}