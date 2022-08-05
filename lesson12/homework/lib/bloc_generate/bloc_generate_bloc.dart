import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:random_generate/random_generate.dart';

part 'bloc_generate_event.dart';
part 'bloc_generate_state.dart';

class GenerateBloc extends Bloc<GenerateEvent, GenerateState> {
  GenerateBloc() : super(GenerateInitial()) {
    on<GenerateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
