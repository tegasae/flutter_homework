import '../generators.dart';
import '_generators/random_generate.dart';
import '_generators/sequence_generate.dart';
import 'service_provider.dart';

class Provider {
  late Services _services;
  late ServiceProvider serviceProvider;
  static final Provider _provider = Provider._internal();

  //Provider(this.services, this.serviceProvider) {
  //  serviceProvider.setup<Generate>(SequenceGenerate('sequence'));
  //  serviceProvider.setup<Services>(services);
  //}

  Provider._internal() {
    _services = Services(
        listServices: [RandomGenerate('random'), SequenceGenerate('sequence')]);
    serviceProvider = ServiceProvider();

    serviceProvider.setup<Generate>(_services.currentService());
    serviceProvider.setup<Services>(_services);

  }

  factory Provider.simple() {

    return _provider;

  }


}
