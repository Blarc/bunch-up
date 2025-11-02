import 'package:bunchup/data/repositories/sport/sport_repository.dart';
import 'package:bunchup/data/services/local/local_data_service.dart';
import 'package:bunchup/domain/models/sport/sport.dart';

class SportRepositoryLocal implements SportRepository {

  SportRepositoryLocal({required LocalDataService localDataService})
      : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  Future<List<Sport>> getAllSports() async {
    return _localDataService.getSports();
  }

}