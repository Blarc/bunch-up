import 'package:bunchup/domain/models/sport/sport.dart';

// Ignored because more functions might be added
// ignore: one_member_abstracts
abstract class SportRepository {
  Future<List<Sport>> getAllSports();
}

