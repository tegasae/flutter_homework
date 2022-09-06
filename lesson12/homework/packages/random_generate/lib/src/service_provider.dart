
import 'package:get_it/get_it.dart';
import 'random_generate.dart';
import 'sequence_generate.dart';

import 'generator.dart';

class DescribeService {
  final Generate _generate;
  final String name;

  DescribeService(this._generate, this.name);
}


class ListServices {

}
class ServiceProvider {
  static final _getIt=GetIt.I;
  T get<T extends Object>() => _getIt.get<T>();
  static final instance=ServiceProvider();

  void setup() {
    _getIt.registerLazySingleton<Generate>(() => SequenceGenerate());
    print('get it');
  }
}