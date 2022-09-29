part of 'generate_bloc.dart';

enum GenerateStatus { start, play, pause, change }

class GenerateState extends Equatable {

  const GenerateState(
      {required this.value, this.status = GenerateStatus.start,});
  final ContainerData value;
  final GenerateStatus status;



  @override
  List<Object> get props => [value, status];
}

class GenerateStateStart extends GenerateState {
  const GenerateStateStart(ContainerData value) : super(value: value);
}

class GenerateStatePlay extends GenerateState {
  const GenerateStatePlay(ContainerData containerData)
      : super(value: containerData, status: GenerateStatus.play);
}

class GenerateStatePause extends GenerateState {
  const GenerateStatePause(ContainerData containerData)
      : super(value: containerData, status: GenerateStatus.pause);
}

class GenerateStateChange extends GenerateState {
  const GenerateStateChange(ContainerData containerData)
      : super(value: containerData, status: GenerateStatus.change);
}
