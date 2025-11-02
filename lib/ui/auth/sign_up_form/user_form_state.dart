// user_form_state.dart
import 'package:bunchup/domain/models/sport/sport.dart';
import 'package:bunchup/domain/models/user/user.dart';

class UserFormState {

  UserFormState({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.dateOfBirth,
    this.country,
    List<Sport>? selectedSports,
    this.skillLevel = SkillLevel.beginner,
  }) : selectedSports = selectedSports ?? [];

  String? firstName;
  String? lastName;
  String? email;
  String? password;
  DateTime? dateOfBirth;
  String? country;
  List<Sport> selectedSports;
  SkillLevel skillLevel;

  // Validation methods
  bool isStepOneComplete() {
    return firstName != null &&
        firstName!.isNotEmpty &&
        lastName != null &&
        lastName!.isNotEmpty &&
        email != null &&
        email!.isNotEmpty &&
        password != null &&
        password!.isNotEmpty &&
        dateOfBirth != null &&
        country != null &&
        country!.isNotEmpty;
  }

  bool isStepTwoComplete() => selectedSports.isNotEmpty;

  bool isStepThreeComplete() => true;

  bool isComplete() =>
      isStepOneComplete() && isStepTwoComplete() && isStepThreeComplete();

  // Convert to freezed User
  User toUser() {
    if (!isComplete()) {
      throw StateError('Form is incomplete');
    }

    return User(
      firstName: firstName!,
      lastName: lastName!,
      email: email!,
      hashedPassword: password!, // Hash this before creating User
      dateOfBirth: dateOfBirth!,
      country: country!,
      sports: selectedSports,
      skillLevel: skillLevel!,
    );
  }
}