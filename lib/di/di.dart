import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:online_exam_app/data/api/api_manager.dart';

import '../data/network/network_info.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  ApiManager get apiManager => ApiManager();
}



void setup() {
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnection()));
}