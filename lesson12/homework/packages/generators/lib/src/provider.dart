import '../generators.dart';
import '_generators/random_generate.dart';
import '_generators/sequence_generate.dart';
import 'service_provider.dart';

class Provider {
  late Services _services;
  late ServiceProvider serviceProvider;
  static final Provider _provider = Provider._internal();

  Provider._internal() {
    _services = Services(
      listServices: [RandomGenerate('Случайные числа'), SequenceGenerate('Последовательность')],
    );
    serviceProvider = ServiceProvider();

    serviceProvider
      ..setup<Generate>(_services.currentService())
      ..setup<Services>(_services);
  }

  factory Provider.simple() {
    return _provider;
  }
}
