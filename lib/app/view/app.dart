import 'package:authentication_repository/authentication_repository.dart';
import 'package:bunchup/app/bloc/app_bloc.dart';
import 'package:bunchup/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        lazy: false,
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        )..add(const AppUserSubscriptionRequested()),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

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
      // TODO(blarc): Not sure if this is correct
      routerConfig: router(BlocProvider.of(context)),
    );
  }
}
