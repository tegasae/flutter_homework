
import 'package:get_it/get_it.dart';
import 'random_generate.dart';
import 'sequence_generate.dart';

import 'generator.dart';



class Services {
  List<Generate> listServices=[];
  int? index;

  Services({this.listServices=const []}) {
    if (listServices.isNotEmpty) {
      index=0;
    }
  }

  List<String> getNames() {
    List<String> names=[];
    listServices.forEach((element) {names.add(element.name);});
    return names;
  }
  Generate? currentService() {
    return index!=null?listServices[index!]:null;
  }


}

class ServiceProvider {
  static final _getIt=GetIt.I;
  T get<T extends Object>() => _getIt.get<T>();
  static final instance=ServiceProvider();

  void setup<T>(T service) {
    _getIt.registerLazySingleton<Generate>(() => SequenceGenerate('sequence'));
    print('get it');
  }
}


class Provider {
  Services services=Services(listServices: [SequenceGenerate('sequence'),RandomGenerate('random')]);
  late ServiceProvider serviceProvider;

}