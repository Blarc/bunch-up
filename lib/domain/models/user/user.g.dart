// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String,
  hashedPassword: json['hashedPassword'] as String,
  dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
  country: json['country'] as String,
  sports: (json['sports'] as List<dynamic>)
      .map((e) => Sport.fromJson(e as Map<String, dynamic>))
      .toList(),
  skillLevel:
      $enumDecodeNullable(_$SkillLevelEnumMap, json['skillLevel']) ??
      SkillLevel.beginner,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'hashedPassword': instance.hashedPassword,
  'dateOfBirth': instance.dateOfBirth.toIso8601String(),
  'country': instance.country,
  'sports': instance.sports,
  'skillLevel': _$SkillLevelEnumMap[instance.skillLevel]!,
};

const _$SkillLevelEnumMap = {
  SkillLevel.beginner: 'beginner',
  SkillLevel.intermediate: 'intermediate',
  SkillLevel.advanced: 'advanced',
  SkillLevel.competitive: 'competitive',
};
