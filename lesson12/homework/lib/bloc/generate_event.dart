part of 'generate_bloc.dart';

abstract class GenerateEvent extends Equatable {
  const GenerateEvent();

  @override
  List<Object> get props => [];
}

class GenerateStartedEvent extends GenerateEvent {
  final ContainerData value=ContainerData.empty;
  const GenerateStartedEvent();
  @override
  List<Object> get props => [value];
}

class GeneratePausedEvent extends GenerateEvent {
  const GeneratePausedEvent();
}

class GenerateResumedEvent extends GenerateEvent {
  const GenerateResumedEvent();
}

class GenerateStoppedEvent extends GenerateEvent {
  const GenerateStoppedEvent();
}


class GenerateRunnedEvent extends GenerateEvent {
  final ContainerData value;
  const GenerateRunnedEvent({required this.value});


  @override
  List<Object> get props => [value];
}
