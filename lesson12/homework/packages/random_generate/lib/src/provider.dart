import '../random_generate.dart';
import 'generators/random_generate.dart';
import 'generators/sequence_generate.dart';
import 'service_provider.dart';

class Provider {
  late Services services;
  late ServiceProvider serviceProvider;
  static final Provider _provider=Provider._internal();


  Provider(this.services, this.serviceProvider) {
    serviceProvider.setup<Generate>(SequenceGenerate('sequence'));
    serviceProvider.setup<Services>(services);
  }

  Provider._internal() {
    services=Services(listServices: [SequenceGenerate('sequence'),RandomGenerate('random')]);
    serviceProvider=ServiceProvider();

    serviceProvider.setup<Generate>(services.currentService());
    serviceProvider.setup<Services>(services);
  }
  factory Provider.simple() {
    return _provider;
  }

  int countServices() {
    return services.listServices.length;
  }

}