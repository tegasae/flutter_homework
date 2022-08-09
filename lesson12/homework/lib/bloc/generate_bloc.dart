import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/random_int.dart';

part 'generate_event.dart';
part 'generate_state.dart';

class RandomBloc extends Bloc<GenerateEvent, GenerateState> {
  final Generate _generate;

  StreamSubscription<ContainerData>? _generateSubscription;

  RandomBloc()
      : _generate = RandomStream(),
        super(const GenerateState.initial()) {
    on<GenerateStartedEvent>(_onStarted);
    on<GeneratePausedEvent>(_onPaused);
    on<GenerateResumedEvent>(_onResumed);
    on<GenerateStoppedEvent>(_onStopped);
    on<GenerateRunnedEvent>(_onRunned);

  }

  @override
  Future<void> close() {

    _generateSubscription?.cancel();
    return super.close();
  }

  void _onStarted(GenerateStartedEvent event, Emitter<GenerateState> emit) {
    emit(GenerateState.run(ContainerData.empty));

    _generateSubscription?.cancel();
    _generateSubscription = _generate
        .get()
        .listen((value) =>add(GenerateRunnedEvent(value: value)));
  }

  void _onPaused(GeneratePausedEvent event, Emitter<GenerateState> emit) {

    if (state.status==GenerateStatus.run) {
      _generateSubscription?.pause();
      emit(GenerateState.pause(state.value));
    }
  }

  void _onResumed(GenerateResumedEvent resume, Emitter<GenerateState> emit) {
    if (state.status==GenerateStatus.pause) {
      _generateSubscription?.resume();
      emit(GenerateState.run(state.value));
    }
  }

  void _onStopped(GenerateStoppedEvent event, Emitter<GenerateState> emit) {
    _generateSubscription?.cancel();
    emit(GenerateState.initial());
  }

  void _onRunned(GenerateRunnedEvent event, Emitter<GenerateState> emit) {
    emit(GenerateState.run(event.value));

  }
}



