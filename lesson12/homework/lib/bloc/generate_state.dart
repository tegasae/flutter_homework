part of 'generate_bloc.dart';

enum _GenerateStatus {start,play,pause}
class GenerateState extends Equatable {
  final ContainerData value;
  final _GenerateStatus status;

  const GenerateState({required this.value, this.status=_GenerateStatus.start});

  //const GenerateState._hidden({this.value=ContainerData.empty,this.status=_GenerateStatus.start});
  //const GenerateState.start():this._hidden();
  //const GenerateState.play(ContainerData containerData):this._hidden(value: containerData,status: _GenerateStatus.play);
  //const GenerateState.pause(ContainerData containerData):this._hidden(value: containerData,status: _GenerateStatus.pause);

  //const GenerateState.stop():this._hidden(status: GenerateStatus.stop);



  @override
  List<Object> get props => [value, status];
}

class GenerateStateStart extends GenerateState {
  const GenerateStateStart(ContainerData value) : super(value: value);
}

class GenerateStatePlay extends GenerateState {
  const GenerateStatePlay(ContainerData containerData):super(value: containerData,status: _GenerateStatus.play);
}

class GenerateStatePause extends GenerateState {
  const GenerateStatePause(ContainerData containerData):super(value: containerData,status: _GenerateStatus.pause);
}