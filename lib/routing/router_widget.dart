import 'package:bunchup/data/repositories/auth/auth_repository_firebase.dart';
import 'package:bunchup/routing/router.dart';
import 'package:bunchup/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouterWidget extends StatelessWidget {
  const RouterWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final authRepository = context.watch<AuthRepositoryFirebase>();
    final user = authRepository.currentUser;

    final router = AppRouter().router;
    final currentLocation = router.routerDelegate.currentConfiguration.uri
        .toString();

    final publicRoutes = <String>[
      Routes.signUp,
      Routes.login,
      Routes.signUpForm,
    ];

    if (user == null && !publicRoutes.contains(currentLocation)) {
      router.go(Routes.signUp);
    }

    if (user != null && publicRoutes.contains(currentLocation)) {
      router.go(Routes.home);
    }

    return child;
  }
}
