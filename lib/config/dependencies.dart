import 'package:bunchup/data/repositories/auth/auth_repository_firebase.dart';
import 'package:bunchup/data/repositories/sport/sport_repository.dart';
import 'package:bunchup/data/repositories/sport/sport_repository_local.dart';
import 'package:bunchup/data/services/local/local_data_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Shared providers for all configurations.
List<SingleChildWidget> _sharedProviders = [
  ChangeNotifierProvider.value(value: AuthRepositoryFirebase()),
];

List<SingleChildWidget> get providersStaging {
  return [
    ..._sharedProviders,
  ];
}

List<SingleChildWidget> get providersLocal {
  return [
    ..._sharedProviders,
    Provider.value(value: LocalDataService()),
    Provider(
      create: (context) =>
          SportRepositoryLocal(localDataService: context.read())
              as SportRepository,
    ),
  ];
}
