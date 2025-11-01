import 'package:bunchup/routing/routes.dart';
import 'package:bunchup/ui/auth/social_button.dart';
import 'package:bunchup/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String _backgroundImageUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAg0qh702eksypb1lRGMcrMhIfGGEWuRY7yHE0ehUaJEbzYrLtd7dHvFVWd_Q0M5tL_J6yn3sXTVaEUUaDjtY_YUw5GMWZhSk0CSukMfSOGO-QBL0mFVpE62z2JgTo7Pk1WpAiUoycn5gimD0KRGiZBTdewfmMMOuzz_C5DkYyoXF8uN60asfjutHSo8G8pBttxrnJ3SvY2X_KSr6JWQRdUPhIK--binmmm245lktKx1hgTWxQKkoFysFNCuY9OnA3PH7wqIX86HzWb';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const NetworkImage(_backgroundImageUrl),
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
        shadows: textShadows(),
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
          const GoogleSocialButton(),
          const SizedBox(height: 12),
          const AppleSocialButton(),
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
        shadows: textShadows(blurRadius: 8),
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
        shadows: textShadows(),
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
              shadows: textShadows(),
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

  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            color: Colors.white,
            shadows: textShadows(),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Handle log in action
            context.go(Routes.login);
          },
          child: Text(
            'Log in',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
              shadows: textShadows(),
            ),
          ),
        ),
      ],
    );
  }


}
