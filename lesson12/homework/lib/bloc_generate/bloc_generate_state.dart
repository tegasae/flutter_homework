part of 'bloc_generate_bloc.dart';

abstract class GenerateState extends Equatable {
  final Generator number;
  GenerateState(this.number);
   @override
   List<Object> get props => [number];
}

class GenerateInitial extends GenerateState {

  GenerateInitial() : super();


}

class GenerateGet extends GenerateState {

  const GenerateGet(int number) : super(number);

}

class GenerateStop extends GenerateState {

  const GenerateStop(int number) : super(number);

}
