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
  GenerateBloc() : super(GenerateInitial()) {
    ServiceProvider.instance.setup();
    generator=_getIt.get<Generator>();
    on<GenerateStartEvent>(_onStart);
    on<GenerateStopEvent>(_onStop);
    on<GenerateStreamEvent>(_onStream);
  }

  void _onStart(GenerateEvent event, Emitter<GenerateState> emitter) {

  }
  void _onStop(GenerateEvent event,Emitter<GenerateState> emitter) {

  }

  _onStream(GenerateEvent event, Emitter<GenerateState> emitter) {

  }
}
