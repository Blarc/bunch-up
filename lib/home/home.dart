import 'package:bunchup/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final auth = context.watch<AuthRepositoryFirebase>();
    // final user = auth.currentUser;
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              // await context.read<AuthRepositoryFirebase>().signOut();
              context.read<AppBloc>().add(const AppLogoutPressed());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${user.name ?? user.email ?? 'User'}!',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () async {
                context.read<AppBloc>().add(const AppLogoutPressed());
              },
              icon: const Icon(Icons.logout),
              label: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
