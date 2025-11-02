import 'package:bunchup/domain/models/sport/sport.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

enum SkillLevel { beginner, intermediate, advanced, competitive }

@freezed
abstract class User with _$User {
  const factory User({
    required String firstName,
    required String lastName,
    required String email,
    required String hashedPassword,
    required DateTime dateOfBirth,
    required String country,
    required List<Sport> sports,
    @Default(SkillLevel.beginner) SkillLevel skillLevel,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
