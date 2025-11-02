import 'package:bunchup/domain/models/sport/sport.dart';

class LocalDataService {
  List<Sport> getSports() {
    return [
      const Sport(name: 'Football'),
      const Sport(name: 'Basketball'),
      const Sport(name: 'Tennis'),
      const Sport(name: 'Volleyball'),
      const Sport(name: 'Baseball'),
      const Sport(name: 'Running'),
      const Sport(name: 'Swimming'),
      const Sport(name: 'Cycling'),
      const Sport(name: 'Golf'),
      const Sport(name: 'Badminton'),
      const Sport(name: 'Table'),
      const Sport(name: 'Hockey'),
    ];
  }
}
