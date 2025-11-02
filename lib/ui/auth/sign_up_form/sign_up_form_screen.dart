import 'package:bunchup/data/repositories/auth/auth_repository_firebase.dart';
import 'package:bunchup/ui/auth/sign_up_form/step_one.dart';
import 'package:bunchup/ui/auth/sign_up_form/step_three.dart';
import 'package:bunchup/ui/auth/sign_up_form/step_two.dart';
import 'package:bunchup/ui/auth/sign_up_form/user_form_state.dart';
import 'package:bunchup/ui/core/themes/dimensions.dart';
import 'package:bunchup/ui/core/ui/primary_button.dart';
import 'package:bunchup/ui/core/ui/simple_step_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUpFormScreen extends StatefulWidget {
  const SignUpFormScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpFormScreenState();
}

class _SignUpFormScreenState extends State<SignUpFormScreen> {
  final PageController _pageController = PageController();

  int currentStep = 0;

  final _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final UserFormState _formState = UserFormState();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool _validateCurrentStep() {
    if (currentStep == 0) {
      // Validate step one
      if (!(_formKeys[0].currentState?.validate() ?? false)) {
        return false;
      }
      if (_formState.dateOfBirth == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select your date of birth')),
        );
        return false;
      }
    } else if (currentStep == 1) {
      // Validate step two
      if (_formState.selectedSports.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select at least one sport')),
        );
        return false;
      }
    } else if (currentStep == 2) {
      // Validate step three
      if (_formState.skillLevel == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select your skill level')),
        );
        return false;
      }
    }
    return true;
  }

  Future<void> _nextStep() async {
    if (!_validateCurrentStep()) {
      return;
    }

    if (currentStep < 2) {
      setState(() {
        currentStep++;
      });
      await _pageController.animateToPage(
        currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _previousStep() async {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
      await _pageController.animateToPage(
        currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _submitForm(BuildContext context) async {
    if (!_validateCurrentStep()) {
      return;
    }

    final auth = context.read<AuthRepositoryFirebase>();
    try {
      await auth.createAccount(
        email: _formState.email!,
        password: _formState.password!,
      );
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? e.code),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            if (currentStep > 0) {
              await _previousStep();
            } else {
              context.pop();
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),
        flexibleSpace: SafeArea(
          child: SimpleStepIndicator(currentStep: currentStep, steps: 3),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              // Disable swipe
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  currentStep = index;
                });
              },
              children: [
                SignUpFormStepOne(formKey: _formKeys[0], formState: _formState),
                SignUpFormStepTwo(formKey: _formKeys[1], formState: _formState),
                SignUpFormStepThree(
                  formKey: _formKeys[2],
                  formState: _formState,
                ),
              ],
            ),
          ),
          Padding(
            padding: Dimensions.of(context).edgeInsetsScreenSymmetric,
            child: PrimaryButton(
              text: currentStep == 2 ? 'Submit' : 'Next',
              onPressed: currentStep == 2
                  ? () => _submitForm(context)
                  : _nextStep,
            ),
          ),
        ],
      ),
    );
  }
}
