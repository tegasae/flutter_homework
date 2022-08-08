part of 'bloc_generate_bloc.dart';

abstract class GenerateEvent extends Equatable {
  const GenerateEvent();

  @override
  List<Object> get props=>[];
}
class GenerateStartEvent extends GenerateEvent {

}

class GenerateStopEvent extends GenerateEvent {

}

class GenerateStreamEvent extends GenerateEvent {

}

