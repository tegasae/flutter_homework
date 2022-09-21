// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContainerData {
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContainerDataCopyWith<ContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContainerDataCopyWith<$Res> {
  factory $ContainerDataCopyWith(
          ContainerData value, $Res Function(ContainerData) then) =
      _$ContainerDataCopyWithImpl<$Res>;
  $Res call({int value});
}

/// @nodoc
class _$ContainerDataCopyWithImpl<$Res>
    implements $ContainerDataCopyWith<$Res> {
  _$ContainerDataCopyWithImpl(this._value, this._then);

  final ContainerData _value;
  // ignore: unused_field
  final $Res Function(ContainerData) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ContainerDataCopyWith<$Res>
    implements $ContainerDataCopyWith<$Res> {
  factory _$$_ContainerDataCopyWith(
          _$_ContainerData value, $Res Function(_$_ContainerData) then) =
      __$$_ContainerDataCopyWithImpl<$Res>;
  @override
  $Res call({int value});
}

/// @nodoc
class __$$_ContainerDataCopyWithImpl<$Res>
    extends _$ContainerDataCopyWithImpl<$Res>
    implements _$$_ContainerDataCopyWith<$Res> {
  __$$_ContainerDataCopyWithImpl(
      _$_ContainerData _value, $Res Function(_$_ContainerData) _then)
      : super(_value, (v) => _then(v as _$_ContainerData));

  @override
  _$_ContainerData get _value => super._value as _$_ContainerData;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_ContainerData(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ContainerData implements _ContainerData {
  const _$_ContainerData({this.value = 0});

  @override
  @JsonKey()
  final int value;

  @override
  String toString() {
    return 'ContainerData(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContainerData &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_ContainerDataCopyWith<_$_ContainerData> get copyWith =>
      __$$_ContainerDataCopyWithImpl<_$_ContainerData>(this, _$identity);
}

abstract class _ContainerData implements ContainerData {
  const factory _ContainerData({final int value}) = _$_ContainerData;

  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_ContainerDataCopyWith<_$_ContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}
