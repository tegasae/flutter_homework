part of 'generate_bloc.dart';

enum GenerateStatus {start,play,pause}
class GenerateState extends Equatable {
  final ContainerData value;
  final GenerateStatus status;

  const GenerateState._hidden({this.value=ContainerData.empty,this.status=GenerateStatus.start});
  const GenerateState.start():this._hidden();
  const GenerateState.play(ContainerData containerData):this._hidden(value: containerData,status: GenerateStatus.play);
  const GenerateState.pause(ContainerData containerData):this._hidden(value: containerData,status: GenerateStatus.pause);
  //const GenerateState.stop():this._hidden(status: GenerateStatus.stop);



  @override
  List<Object> get props => [value, status];
}

class GenerateStateStart extends GenerateState {

  GenerateStateStart() : super.pause(null);
}