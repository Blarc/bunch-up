import 'package:bunchup/data/repositories/auth/auth_repository_firebase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GoogleSocialButton extends SocialButton {
  const GoogleSocialButton({
    super.key,
  }) : super(
         label: 'Continue with Google',
         icon: Icons.g_mobiledata,
         iconSize: 32,
         backgroundColor: Colors.white,
         foregroundColor: Colors.black87,
         signIn: _handleGoogleSignIn,
       );

  static Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      await context.read<AuthRepositoryFirebase>().signInWithGoogle();
      // Navigation handled automatically by GoRouter
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Google sign-in failed: $e')),
        );
      }
      rethrow;
    }
  }
}

class AppleSocialButton extends SocialButton {
  const AppleSocialButton({
    super.key,
  }) : super(
         label: 'Continue with Apple',
         icon: Icons.apple,
         iconSize: 28,
         backgroundColor: Colors.black,
         foregroundColor: Colors.white,
         signIn: _handleAppleSignIn,
       );

  static Future<void> _handleAppleSignIn(BuildContext context) async {
    // TODO(blarc): Implement Apple sign in
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.label,
    required this.icon,
    required this.iconSize,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.signIn,
    super.key,
  });

  final String label;
  final IconData icon;
  final double iconSize;
  final Color backgroundColor;
  final Color foregroundColor;
  final Future<void> Function(BuildContext) signIn;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 36,
      child: ElevatedButton.icon(
        onPressed: () => signIn(context),
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
}
