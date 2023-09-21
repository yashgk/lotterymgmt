import 'package:get_it/get_it.dart';
import 'package:lotto_mgmt/core/repo/auth_repo.dart';
import 'package:lotto_mgmt/core/repo/entry_repo.dart';
import 'package:lotto_mgmt/core/service/auth_services.dart';
import 'package:lotto_mgmt/core/service/entry_services.dart';

final serviceLocator = GetIt.instance;
void setUpServiceLocator() {
  //Service
  serviceLocator.registerLazySingleton<AuthService>(() => AuthService());
  serviceLocator.registerLazySingleton<EntryService>(() => EntryService());

  //Repository
  serviceLocator.registerLazySingleton<AuthRepo>(() => AuthRepo());
  serviceLocator.registerLazySingleton<EntryRepo>(() => EntryRepo());
}
