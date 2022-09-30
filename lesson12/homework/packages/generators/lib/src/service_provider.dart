import 'package:get_it/get_it.dart';

class ServiceProvider {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  //static final instance=ServiceProvider();

  void setup<T extends Object>(T service) {
    if (_getIt.isRegistered<T>()) {
      _getIt.unregister<T>();
    }

    _getIt.registerLazySingleton<T>(() => service);
  }
}
