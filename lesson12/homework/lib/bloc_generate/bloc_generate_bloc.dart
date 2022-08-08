import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:random_generate/random_generate.dart';

part 'bloc_generate_event.dart';
part 'bloc_generate_state.dart';

class GenerateBloc extends Bloc<GenerateEvent, GenerateState> {
  static final _getIt=GetIt.I;
  T get<T extends Object>()=>_getIt.get<T>();
  late Generator generator;
  GenerateBloc() : super(const GenerateState.init()) {
    ServiceProvider.instance.setup();
    generator=_getIt.get<Generator>();
    on<GenerateNextEvent>(_onNext);
    on<GenerateStopEvent>(_onStop);
    on<GenerateStreamEvent>(_onStream);
  }

  void _onNext(GenerateEvent event, Emitter<GenerateState> emitter) {
    
  }
  void _onStop(GenerateEvent event,Emitter<GenerateState> emitter) {

  }

  void _onStream(GenerateEvent event, Emitter<GenerateState> emitter) {

  }

  @override
  Future<void> close() {
    generator.dispose();
    return super.close();
  }
}
