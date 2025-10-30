import 'package:bunchup/data/repositories/auth/auth_repository_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const String _backgroundImageUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAg0qh702eksypb1lRGMcrMhIfGGEWuRY7yHE0ehUaJEbzYrLtd7dHvFVWd_Q0M5tL_J6yn3sXTVaEUUaDjtY_YUw5GMWZhSk0CSukMfSOGO-QBL0mFVpE62z2JgTo7Pk1WpAiUoycn5gimD0KRGiZBTdewfmMMOuzz_C5DkYyoXF8uN60asfjutHSo8G8pBttxrnJ3SvY2X_KSr6JWQRdUPhIK--binmmm245lktKx1hgTWxQKkoFysFNCuY9OnA3PH7wqIX86HzWb';


  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      await context.read<AuthRepositoryFirebase>().signInWithGoogle();
      // Navigation handled automatically by GoRouter
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Google sign-in failed: ${e.toString()}')),
        );
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(_backgroundImageUrl),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withAlpha(130),
                BlendMode.darken,
              )
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              const Spacer(),
              _buildLoginContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          _buildLogo(),
          const SizedBox(width: 12),
          _buildBrandName(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.groups,
        color: Colors.white,
        size: 28,
      ),
    );
  }

  Widget _buildBrandName() {
    return Text(
      'BunchUp',
      style: GoogleFonts.plusJakartaSans(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: _textShadows(),
      ),
    );
  }

  Widget _buildLoginContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          _buildHeadline(),
          const SizedBox(height: 16),
          _buildSubtitle(),
          const SizedBox(height: 48),
          _buildJoinButton(),
          const SizedBox(height: 16),
          _buildDivider(),
          const SizedBox(height: 16),
          _buildSocialButton(
            label: 'Continue with Google',
            icon: Icons.g_mobiledata,
            iconSize: 32,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black87,
            onPressed: () {
              _handleGoogleSignIn(context);
            },
          ),
          const SizedBox(height: 12),
          _buildSocialButton(
            label: 'Continue with Apple',
            icon: Icons.apple,
            iconSize: 28,
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            onPressed: () {
              // Handle Apple sign-in
            },
          ),
          const SizedBox(height: 20),
          _buildLoginLink(context),
        ],
      ),
    );
  }

  Widget _buildHeadline() {
    return Text(
      'Your Team is\nWaiting',
      textAlign: TextAlign.center,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        height: 1.2,
        shadows: _textShadows(blurRadius: 8),
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'The #1 platform to find training partners and join local sports events.',
      textAlign: TextAlign.center,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 16,
        color: Colors.white,
        height: 1.4,
        shadows: _textShadows(),
      ),
    );
  }

  Widget _buildJoinButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          // Handle Join the Bunch action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 4,
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: const Text('Join the Bunch'),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'OR',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              shadows: _textShadows(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required String label,
    required IconData icon,
    required double iconSize,
    required Color backgroundColor,
    required Color foregroundColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 36,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: iconSize),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 2,
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            color: Colors.white,
            shadows: _textShadows(),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Handle log in action
            print("clicked on log in");
            context.go('/login');
          },
          child: Text(
            'Log in',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
              shadows: _textShadows(),
            ),
          ),
        ),
      ],
    );
  }

  List<Shadow> _textShadows({double blurRadius = 4}) {
    return [
      Shadow(
        offset: Offset(0, blurRadius == 8 ? 2 : 1),
        blurRadius: blurRadius,
        color: Colors.black54,
      ),
    ];
  }
}