
import 'package:get_it/get_it.dart';


import 'generator.dart';



class Services {
  List<Generate> listServices=[];
  int index=0;

  Services({this.listServices=const []});

  List<String> getNames() {
    List<String> names=[];
    listServices.forEach((element) {names.add(element.name);});
    return names;
  }
  Generate currentService() {
    return listServices[index];
  }


}

class ServiceProvider {
  static final _getIt=GetIt.I;
  T get<T extends Object>() => _getIt.get<T>();
  //static final instance=ServiceProvider();

  void setup<T extends Object>(T service) {
    //_getIt.registerLazySingleton<Generate>(() => SequenceGenerate('sequence'));
    print('123');
    _getIt.registerLazySingleton<T>(() => service);
    print('get it');
  }
}


