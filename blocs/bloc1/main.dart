import 'dart:async';

import 'package:bloc/bloc.dart';

main() async {
  CounterCubit cubit=CounterCubit(10);
  //final subscription = cubit.stream.listen(print); // 1


  print('123');

  //cubit
 //..increment()
 //..close();
 // print('123');
 // await Future.delayed(Duration(seconds: 1));
 // await subscription.cancel();
 // await cubit.close();


  BlocOverrides.runZoned(
        () {
        CounterCubit(10)
        ..increment()
        ..close();
    },
    blocObserver: SimpleBlocObserver(),
  );


}

class CounterCubit extends Cubit<int> {
  CounterCubit(int initialState) : super(initialState);
  void increment() => emit(state +1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    //print(change);
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    //print('${bloc.runtimeType} $change');
    print('${bloc.runtimeType} $change');
  }
}