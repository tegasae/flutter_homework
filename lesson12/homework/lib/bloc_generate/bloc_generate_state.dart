part of 'bloc_generate_bloc.dart';

class GenerateState extends Equatable {
  final int number;



  const GenerateState._hidden({this.number=0});
  const GenerateState.init():this._hidden();
  const GenerateState.get(int number):this._hidden(number: number);
  const GenerateState.stop():this._hidden();

  @override
  List<Object> get props => [number];
}

