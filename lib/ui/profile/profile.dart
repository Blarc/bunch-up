import 'package:bunchup/data/repositories/auth/auth_repository_firebase.dart';
import 'package:bunchup/ui/core/localization/applocalization.dart';
import 'package:bunchup/ui/core/themes/colors.dart';
import 'package:bunchup/ui/core/themes/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthRepositoryFirebase>();
    final user = auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              await context.read<AuthRepositoryFirebase>().signOut();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.of(context).paddingScreenVertical,
            horizontal: Dimensions.of(context).paddingScreenHorizontal
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: user?.photoURL != null
                      ? Image.network(user!.photoURL!, fit: BoxFit.cover)
                      : Image.asset(
                      'assets/images/profile/avatar.jpg', fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                user?.displayName ?? 'User',
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineLarge,
              ),
              Text(
                user?.email ?? 'user@email.com',
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue1
                  ),
                  child: Text(AppLocalization
                      .of(context)
                      .profileEditButton),
                ),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 24),
            ],
          ),
        )
      ),
    );
  }
}
