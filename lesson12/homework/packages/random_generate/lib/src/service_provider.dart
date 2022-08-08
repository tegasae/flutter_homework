
import 'package:get_it/get_it.dart';
import 'package:random_generate/src/random_generate.dart';

import 'generator.dart';

class ServiceProvider {
  static final _getIt=GetIt.I;
  T get<T extends Object>() =>_getIt.get<T>();
  static final instance=ServiceProvider();

  void setup() {
    _getIt.registerLazySingleton<Generator>(() => RandomGenerate());
  }
}