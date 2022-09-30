part of 'generate_bloc.dart';

abstract class GenerateEvent extends Equatable {
  const GenerateEvent();

  @override
  List<Object> get props => [];
}

class GeneratePausing extends GenerateEvent {
  const GeneratePausing();
}

class GenerateStopping extends GenerateEvent {
  const GenerateStopping();
}

class GeneratePlaying extends GenerateEvent {
  const GeneratePlaying({required this.value});

  final ContainerData value;

  @override
  List<Object> get props => [value];
}

class GenerateChanning extends GenerateEvent {
  const GenerateChanning();
}
