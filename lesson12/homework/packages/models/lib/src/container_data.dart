import 'package:freezed_annotation/freezed_annotation.dart';

part 'container_data.freezed.dart';

@freezed
class ContainerData with _$ContainerData {
  const factory ContainerData({@Default(0) int value}) = _ContainerData;
}
