part of 'bloc_generate_bloc.dart';

abstract class GenerateState extends Equatable {
  const GenerateState();
}

class GenerateInitial extends GenerateState {
  final int number;

  const GenerateInitial({this.number=0});

  @override
  List<Object> get props => [number];
}

class GenerateGet extends GenerateState {
  final int number;
  const GenerateGet({required this.number});
  @override
  List<Object> get props=>[number];
}

class GenerateStop extends GenerateState {
  final int number;
  const GenerateStop({required this.number});
  @override
  List<Object> get props=>[number];
}
