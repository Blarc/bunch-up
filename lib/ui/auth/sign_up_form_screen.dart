import 'package:bunchup/ui/auth/simple_step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpFormScreen extends StatefulWidget {
  const SignUpFormScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpFormScreenState();
}

class _SignUpFormScreenState extends State<SignUpFormScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        flexibleSpace: SafeArea(
          child: SimpleStepIndicator(currentStep: currentStep),
        ),
      ),
    );
  }
}
