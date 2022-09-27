import 'package:freezed_annotation/freezed_annotation.dart';

part 'container_data.freezed.dart';

@freezed
class ContainerData with _$ContainerData {
  //final int value;
  const factory ContainerData({@Default(0) int value}) = _ContainerData;

//static const empty=ContainerData(0);

}
