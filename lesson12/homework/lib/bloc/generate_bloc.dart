import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:generators/generators.dart';
import 'package:models/models.dart';

part 'generate_event.dart';
part 'generate_state.dart';

class GenerateBloc extends Bloc<GenerateEvent, GenerateState> {

  GenerateBloc()
      :
        _provider=Provider.simple(),
        super(const GenerateStateStart(ContainerData())) {
    _generate=_provider.serviceProvider.get<Generate>();
    on<GeneratePlaying>(_onPlay);
    on<GeneratePausing>(_onPause);
    on<GenerateStopping>(_onStop);
    on<GenerateChanning>(_onChange);
  }
  
  late Generate _generate;
  final Provider _provider;
  

  StreamSubscription<ContainerData>? _generateSubscription;
  late Stream<ContainerData> _streamContainerData;

  @override
  Future<void> close() {
    _generateSubscription?.cancel();
    return super.close();
  }

  void _onPlay(GeneratePlaying event, Emitter<GenerateState> emit) {
    if (state is GenerateStateStart) {
      _generateSubscription?.cancel();

      //_generate.flag=true;

      _streamContainerData = _generate.getController();

      _generateSubscription = _streamContainerData.listen(
          (value) => add(GeneratePlaying(value: value)),
          onDone: () => add(const GenerateStopping()),);
    }

    if (state is GenerateStatePause) {
      _generateSubscription?.resume();
    }

    emit(GenerateStatePlay(event.value));
  }

  void _onPause(GeneratePausing event, Emitter<GenerateState> emit) {
    if (state is GenerateStatePlay) {
      _generateSubscription?.pause();
      emit(GenerateStatePause(state.value));
    }
  }

  void _onStop(GenerateStopping event, Emitter<GenerateState> emit) {
    _generateSubscription?.cancel();

    emit(const GenerateStateStart(ContainerData()));
  }

  void _onChange(GenerateChanning event, Emitter<GenerateState> emit) {
    _generateSubscription?.cancel();
    //_generate = Provider.simple().services.currentService();
    _generate = _provider.serviceProvider.get<Generate>();

    emit(const GenerateStateChange(ContainerData()));
    emit(const GenerateStateStart(ContainerData()));
  }
//void _onStarted(GenerateStartedEvent event, Emitter<GenerateState> emit) {
//  emit(GenerateState.run(ContainerData.empty));
//
//  _generateSubscription?.cancel();
//  _generate.flag=true;
//  print(_generate.flag);
//  _generateSubscription = _generate
//      .get()
//      .listen((value) =>add(GenerateRunnedEvent(value: value)));
//}

//void _onPaused(GeneratePausedEvent event, Emitter<GenerateState> emit) {
//
//  if (state.status==GenerateStatus.run) {
//    _generateSubscription?.pause();
//    emit(GenerateState.pause(state.value));
//  }
//}

//void _onResumed(GenerateResumedEvent resume, Emitter<GenerateState> emit) {
//  if (state.status==GenerateStatus.pause) {
//    _generateSubscription?.resume();
//    emit(GenerateState.run(state.value));
//  }
//}

//void _onStopped(GenerateStoppedEvent event, Emitter<GenerateState> emit) {
//  _generateSubscription?.cancel();
//  emit(GenerateState.stop());
//}

//void _onRunned(GenerateRunnedEvent event, Emitter<GenerateState> emit) {
//  if (_generate.flag) {
//    emit(GenerateState.run(event.value));
//
//  } else {
//    emit(const GenerateState.stop());
//  }

//}
}
