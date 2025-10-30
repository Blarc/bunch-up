import 'package:bunchup/data/repositories/auth/auth_repository_firebase.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


/// Shared providers for all configurations.
List<SingleChildWidget> _sharedProviders = [
  ChangeNotifierProvider.value(value: AuthRepositoryFirebase())
];

List<SingleChildWidget> get providersStaging {
  return [
    ..._sharedProviders,
  ];
}

List<SingleChildWidget> get providersLocal {
  return [
    ..._sharedProviders,
  ];
}