part of 'generate_bloc.dart';

enum GenerateStatus {initial,run,pause,stop}
class GenerateState extends Equatable {
  final ContainerData value;
  final GenerateStatus status;

  const GenerateState._hidden({this.value=ContainerData.empty,this.status=GenerateStatus.initial});
  const GenerateState.initial():this._hidden();
  const GenerateState.run(ContainerData containerData):this._hidden(value: containerData,status: GenerateStatus.run);
  const GenerateState.pause(ContainerData containerData):this._hidden(value: containerData,status: GenerateStatus.pause);
  const GenerateState.stop():this._hidden(status: GenerateStatus.stop);



  @override
  List<Object> get props => [value, status];
}

//class GenerateInitial extends GenerateState {
//  const GenerateInitial() : super(const ContainerData(0));

//  @override
//  String toString() => 'RandomInitial { value: $value }';
//}

//class GenerateRun extends GenerateState {
  //const GenerateRun(ContainerData value) : super(value);

  //@override
  //String toString() => 'RandomRun { value: $value }';
//}

//class GeneratePause extends GenerateState {
//  const GeneratePause(ContainerData value) : super(value);

//  @override
//  String toString() => 'RandomPause { value: $value }';
//}

//class GenerateStop extends GenerateState {
//  const GenerateStop() : super(const ContainerData(0));
//}
