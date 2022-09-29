import 'package:get_it/get_it.dart';





class ServiceProvider {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  //static final instance=ServiceProvider();

  void setup<T extends Object>(T service) {
    print('setup');
    if (_getIt.isRegistered<T>()) {
      _getIt.unregister<T>();
    }

    //_getIt.registerLazySingleton<Generate>(() => SequenceGenerate('sequence'));
    print('123');
    _getIt.registerLazySingleton<T>(() => service);
    print('get it');
  }
}
