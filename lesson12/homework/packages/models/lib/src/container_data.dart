import 'package:freezed_annotation/freezed_annotation.dart';

//part 'user_data.freezed.dart';

@freezed
class ContainerData {
  final int value;

  const ContainerData(this.value);
  const ContainerData.empty({this.value=0});

  @override
  String toString() {
    return value.toString();
  }
//static const empty=ContainerData(0);


}
