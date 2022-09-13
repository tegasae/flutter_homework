import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import 'package:random_generate/random_generate.dart';
part 'generate_event.dart';
part 'generate_state.dart';

class GenerateBloc extends Bloc<GenerateEvent, GenerateState> {
  //static final _getIt=GetIt.I;
  //T get<T extends Object>()=>_getIt.get<T>();
  final Generate _generate;
  //late Generator _generate;

  StreamSubscription<ContainerData>? _generateSubscription;

  GenerateBloc()

      :_generate=Provider.simple().services.currentService(),
      //:_generate=Provider.simple().services.listServices[1],
    super(GenerateStateStart(ContainerData.empty))
    {

    on<GeneratePlaying>(_onPlay);
    on<GeneratePausing>(_onPause);
    on<GenerateStopping>(_onStop);


  }

  @override
  Future<void> close() {

    _generateSubscription?.cancel();
    return super.close();
  }

  void _onPlay(GeneratePlaying event,Emitter<GenerateState> emit) {
    if (state is GenerateStateStart) {
      _generateSubscription?.cancel();

      _generate.flag=true;
      _generateSubscription = _generate
          .get()
          .listen((value) =>add(GeneratePlaying(value: value)));
      emit(GenerateStatePlay(state.value));
      return;
    }

    if (state is GenerateStatePause) {
      _generateSubscription?.resume();
      emit(GenerateStatePlay(state.value));
      return;
    }
    if (state is GenerateStatePlay) {
      if (_generate.flag) {
          emit(GenerateStatePlay(event.value));
        } else {
          emit(GenerateStateStart(ContainerData.empty));
        }
    }


  }

  void _onPause(GeneratePausing event,Emitter<GenerateState> emit) {
    if (state is GenerateStatePlay) {
      _generateSubscription?.pause();
      emit(GenerateStatePause(state.value));
    }
  }

  void _onStop(GenerateStopping event,Emitter<GenerateState> emit) {
    _generateSubscription?.cancel();
    _generate.flag=false;
    emit(GenerateStateStart(ContainerData.empty));
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




