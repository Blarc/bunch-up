import 'package:freezed_annotation/freezed_annotation.dart';

part 'sport.freezed.dart';

part 'sport.g.dart';

@freezed
abstract class Sport with _$Sport {
  const factory Sport({
    required String name,
  }) = _Sport;

  factory Sport.fromJson(Map<String, Object?> json) => _$SportFromJson(json);

}
