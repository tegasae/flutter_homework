import 'dart:io';

import 'package:bloc4/model/count.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CounterState  {
  final int result;
  CounterState(this.result);
  @override
  bool operator ==(Object other) {
      print(identical(other, this));
      return identical(other, this);
  }
}

class CounterStateWait extends CounterState {
  CounterStateWait() : super(-1);
}




class CounterCubit extends Cubit<CounterState> {
  Counter counter=Counter(0);

  CounterCubit() : super(CounterState(0));
  //CounterCubit() : super(10);

  void increment(int i) async {
    int c;
    print('increment');
    counter.increment(i:i);
    emit(CounterStateWait());
    print('await');
    c=await counter.fetchInt();
    print('done');
    print(c);
    emit(CounterState(c));

    //sleep(Duration(seconds: 2));
    //Future.delayed(Duration(seconds: 2));
    //counter.increment(i:i);

    //emit(CounterState(counter.count));
  }

  @override
  void onChange(Change<CounterState> change) {
    super.onChange(change);
    print('change $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}