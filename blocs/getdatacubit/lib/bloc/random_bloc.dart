import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:getdatacubit/data_source/data.dart';



abstract class RandomEvent extends Equatable {
  const RandomEvent();

  @override
  List<Object> get props => [];
}

class RandomStarted extends RandomEvent {
  const RandomStarted();

}

class RandomPaused extends RandomEvent {
  const RandomPaused();
}

class RandomReset extends RandomEvent {
  const RandomReset();
}

class RandomTicked extends RandomEvent {
  const RandomTicked({required this.value});
  final int value;

  @override
  List<Object> get props => [value];
}




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


class RandomRunInProgress extends RandomState {
  const RandomRunInProgress(int value) : super(value);

  @override
  String toString() => 'RandomRunInProgress { value: $value }';
}

class RandomRunComplete extends RandomState {
  const RandomRunComplete() : super(0);
}



class RandomBloc extends Bloc<RandomEvent, RandomState> {
  GenerateNumber _generateNumber;


  StreamSubscription<int>? _generateNumberSubscription;

  RandomBloc({required GenerateNumber gn})
      : _generateNumber = gn,
        super(RandomInitial()) {

    on<RandomStarted>(_onStarted);
    on<RandomPaused>(_onPaused);
    on<RandomReset>(_onReset);
    on<RandomTicked>(_onTicked);
  }

  @override
  Future<void> close() {
    _generateNumberSubscription?.cancel();
    return super.close();
  }

  void _onStarted(RandomStarted event, Emitter<RandomState> emit) {
    emit(RandomRunInProgress());
    _generateNumberSubscription?.cancel();
    _generateNumberSubscription = _generateNumber.stream.listen((value) => add(RandomTicked(duration: duration)));
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration));
    }
  }

  void _onResumed(TimerResumed resume, Emitter<TimerState> emit) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration));
    }
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(TimerInitial(_duration));
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0
          ? TimerRunInProgress(event.duration)
          : TimerRunComplete(),
    );
  }
}
