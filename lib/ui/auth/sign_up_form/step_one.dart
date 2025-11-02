import 'package:bunchup/domain/models/user/user.dart';
import 'package:bunchup/ui/auth/sign_up_form/user_form_state.dart';
import 'package:flutter/material.dart';

class SignUpFormStepOne extends StatefulWidget {
  const SignUpFormStepOne({
    required this.formKey,
    required this.formState,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final UserFormState formState;

  @override
  State<SignUpFormStepOne> createState() => _SignUpFormStepOneState();
}

class _SignUpFormStepOneState extends State<SignUpFormStepOne> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final List<String> _countries = [
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
    'Germany',
    'France',
    'Spain',
    'Italy',
    // Add more countries as needed
  ];

  @override
  void initState() {
    super.initState();
    // Load existing data if any
    _firstNameController.text = widget.formState.firstName ?? '';
    _lastNameController.text = widget.formState.lastName ?? '';
    _emailController.text = widget.formState.email ?? '';
    _passwordController.text = widget.formState.password ?? '';
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate:
          widget.formState.dateOfBirth ??
          DateTime.now().subtract(const Duration(days: 6570)), // 18 years ago
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != widget.formState.dateOfBirth) {
      setState(() {
        widget.formState.dateOfBirth = picked;
      });
    }
  }

  void _saveData() {
    widget.formState.firstName = _firstNameController.text;
    widget.formState.lastName = _lastNameController.text;
    widget.formState.email = _emailController.text;
    widget.formState.password = _passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Join Bunch Up',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create your account to connect with athletes.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
              ),
              textInputAction: TextInputAction.next,
              onChanged: (_) => _saveData(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
              ),
              textInputAction: TextInputAction.next,
              onChanged: (_) => _saveData(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChanged: (_) => _saveData(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_outline),
              ),
              obscureText: true,
              textInputAction: TextInputAction.next,
              onChanged: (_) => _saveData(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.calendar_today_outlined),
                  errorText:
                      widget.formState.dateOfBirth == null &&
                          widget.formKey.currentState?.validate() == false
                      ? 'Please select your date of birth'
                      : null,
                ),
                child: Text(
                  widget.formState.dateOfBirth != null
                      ? '${widget.formState.dateOfBirth!.day}/${widget.formState.dateOfBirth!.month}/${widget.formState.dateOfBirth!.year}'
                      : 'Select date',
                  style: TextStyle(
                    color: widget.formState.dateOfBirth != null
                        ? Colors.black
                        : Colors.grey[600],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: widget.formState.country,
              decoration: const InputDecoration(
                labelText: 'Country',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.public_outlined),
              ),
              items: _countries.map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  widget.formState.country = newValue;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select your country';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
