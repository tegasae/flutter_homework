import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_int_bloc/data/random_int.dart';

abstract class RandomState extends Equatable {
  final int value;

  const RandomState(this.value);

  @override
  List<Object> get props => [value];
}

class RandomInitial extends RandomState {
  const RandomInitial() : super(0);

  @override
  String toString() => 'RandomInitial { value: $value }';
}

class RandomRun extends RandomState {
  const RandomRun(int value) : super(value);

  @override
  String toString() => 'RandomRun { value: $value }';
}

class RandomPause extends RandomState {
  const RandomPause(int value) : super(value);

  @override
  String toString() => 'RandomPause { value: $value }';
}

class RandomStop extends RandomState {
  const RandomStop() : super(0);
}


abstract class RandomEvent extends Equatable {
  const RandomEvent();

  @override
  List<Object> get props => [];
}

class RandomStarted extends RandomEvent {
  final int value;
  const RandomStarted({required this.value});
  @override
  List<Object> get props => [value];
}

class RandomPaused extends RandomEvent {
  const RandomPaused();
}

class RandomResumed extends RandomEvent {
  const RandomResumed();
}

class RandomStopped extends RandomEvent {
  const RandomStopped();
}


class RandomRunned extends RandomEvent {
  final int value;
  const RandomRunned({required this.value});


  @override
  List<Object> get props => [value];
}


class RandomBloc extends Bloc<RandomEvent, RandomState> {
  final RandomStream _randomStream;


  StreamSubscription<int>? _randomSubscription;

  RandomBloc()
      : _randomStream = RandomStream  (),
        super(const RandomInitial()) {
    on<RandomStarted>(_onStarted);
    on<RandomPaused>(_onPaused);
    on<RandomResumed>(_onResumed);
    on<RandomStopped>(_onStopped);
    on<RandomRunned>(_onRunned);

  }

  @override
  Future<void> close() {
    _randomSubscription?.cancel();
    return super.close();
  }

  void _onStarted(RandomStarted event, Emitter<RandomState> emit) {
    emit(RandomRun(0));
    _randomSubscription?.cancel();
    _randomSubscription = _randomStream
        .rand()
        //.listen((value) => add(RandomTicked(value: value)));
        //.listen((value) =>add(RandomStarted(value: value)));
        .listen((value) =>add(RandomRunned(value: value)));
  }

  void _onPaused(RandomPaused event, Emitter<RandomState> emit) {
    if (state is RandomRun) {
      _randomSubscription?.pause();
      emit(RandomPause(state.value));
    }
  }

  void _onResumed(RandomResumed resume, Emitter<RandomState> emit) {
    if (state is RandomPause) {
      _randomSubscription?.resume();
      emit(RandomRun(state.value));
    }
  }

  void _onStopped(RandomStopped event, Emitter<RandomState> emit) {
    _randomSubscription?.cancel();
    emit(RandomInitial());
  }

  void _onRunned(RandomRunned event, Emitter<RandomState> emit) {
    emit(RandomRun(event.value));

  }
}



