// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 String get firstName; String get lastName; String get email; String get hashedPassword; DateTime get dateOfBirth; String get country; List<Sport> get sports; SkillLevel get skillLevel;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.hashedPassword, hashedPassword) || other.hashedPassword == hashedPassword)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other.sports, sports)&&(identical(other.skillLevel, skillLevel) || other.skillLevel == skillLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,hashedPassword,dateOfBirth,country,const DeepCollectionEquality().hash(sports),skillLevel);

@override
String toString() {
  return 'User(firstName: $firstName, lastName: $lastName, email: $email, hashedPassword: $hashedPassword, dateOfBirth: $dateOfBirth, country: $country, sports: $sports, skillLevel: $skillLevel)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String email, String hashedPassword, DateTime dateOfBirth, String country, List<Sport> sports, SkillLevel skillLevel
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? email = null,Object? hashedPassword = null,Object? dateOfBirth = null,Object? country = null,Object? sports = null,Object? skillLevel = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,hashedPassword: null == hashedPassword ? _self.hashedPassword : hashedPassword // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,sports: null == sports ? _self.sports : sports // ignore: cast_nullable_to_non_nullable
as List<Sport>,skillLevel: null == skillLevel ? _self.skillLevel : skillLevel // ignore: cast_nullable_to_non_nullable
as SkillLevel,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String email,  String hashedPassword,  DateTime dateOfBirth,  String country,  List<Sport> sports,  SkillLevel skillLevel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.hashedPassword,_that.dateOfBirth,_that.country,_that.sports,_that.skillLevel);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String email,  String hashedPassword,  DateTime dateOfBirth,  String country,  List<Sport> sports,  SkillLevel skillLevel)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.firstName,_that.lastName,_that.email,_that.hashedPassword,_that.dateOfBirth,_that.country,_that.sports,_that.skillLevel);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  String email,  String hashedPassword,  DateTime dateOfBirth,  String country,  List<Sport> sports,  SkillLevel skillLevel)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.hashedPassword,_that.dateOfBirth,_that.country,_that.sports,_that.skillLevel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.firstName, required this.lastName, required this.email, required this.hashedPassword, required this.dateOfBirth, required this.country, required final  List<Sport> sports, this.skillLevel = SkillLevel.beginner}): _sports = sports;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String firstName;
@override final  String lastName;
@override final  String email;
@override final  String hashedPassword;
@override final  DateTime dateOfBirth;
@override final  String country;
 final  List<Sport> _sports;
@override List<Sport> get sports {
  if (_sports is EqualUnmodifiableListView) return _sports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sports);
}

@override@JsonKey() final  SkillLevel skillLevel;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.hashedPassword, hashedPassword) || other.hashedPassword == hashedPassword)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other._sports, _sports)&&(identical(other.skillLevel, skillLevel) || other.skillLevel == skillLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,hashedPassword,dateOfBirth,country,const DeepCollectionEquality().hash(_sports),skillLevel);

@override
String toString() {
  return 'User(firstName: $firstName, lastName: $lastName, email: $email, hashedPassword: $hashedPassword, dateOfBirth: $dateOfBirth, country: $country, sports: $sports, skillLevel: $skillLevel)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, String email, String hashedPassword, DateTime dateOfBirth, String country, List<Sport> sports, SkillLevel skillLevel
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? email = null,Object? hashedPassword = null,Object? dateOfBirth = null,Object? country = null,Object? sports = null,Object? skillLevel = null,}) {
  return _then(_User(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,hashedPassword: null == hashedPassword ? _self.hashedPassword : hashedPassword // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,sports: null == sports ? _self._sports : sports // ignore: cast_nullable_to_non_nullable
as List<Sport>,skillLevel: null == skillLevel ? _self.skillLevel : skillLevel // ignore: cast_nullable_to_non_nullable
as SkillLevel,
  ));
}


}

// dart format on
