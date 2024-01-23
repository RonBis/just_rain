// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'droplet_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DropletConfig {
  int get density => throw _privateConstructorUsedError;
  double get length => throw _privateConstructorUsedError;
  double get angle => throw _privateConstructorUsedError;
  Paint get paint => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DropletConfigCopyWith<DropletConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DropletConfigCopyWith<$Res> {
  factory $DropletConfigCopyWith(
          DropletConfig value, $Res Function(DropletConfig) then) =
      _$DropletConfigCopyWithImpl<$Res, DropletConfig>;
  @useResult
  $Res call({int density, double length, double angle, Paint paint, int time});
}

/// @nodoc
class _$DropletConfigCopyWithImpl<$Res, $Val extends DropletConfig>
    implements $DropletConfigCopyWith<$Res> {
  _$DropletConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? density = null,
    Object? length = null,
    Object? angle = null,
    Object? paint = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      density: null == density
          ? _value.density
          : density // ignore: cast_nullable_to_non_nullable
              as int,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double,
      angle: null == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as double,
      paint: null == paint
          ? _value.paint
          : paint // ignore: cast_nullable_to_non_nullable
              as Paint,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DropletConfigImplCopyWith<$Res>
    implements $DropletConfigCopyWith<$Res> {
  factory _$$DropletConfigImplCopyWith(
          _$DropletConfigImpl value, $Res Function(_$DropletConfigImpl) then) =
      __$$DropletConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int density, double length, double angle, Paint paint, int time});
}

/// @nodoc
class __$$DropletConfigImplCopyWithImpl<$Res>
    extends _$DropletConfigCopyWithImpl<$Res, _$DropletConfigImpl>
    implements _$$DropletConfigImplCopyWith<$Res> {
  __$$DropletConfigImplCopyWithImpl(
      _$DropletConfigImpl _value, $Res Function(_$DropletConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? density = null,
    Object? length = null,
    Object? angle = null,
    Object? paint = null,
    Object? time = null,
  }) {
    return _then(_$DropletConfigImpl(
      density: null == density
          ? _value.density
          : density // ignore: cast_nullable_to_non_nullable
              as int,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double,
      angle: null == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as double,
      paint: null == paint
          ? _value.paint
          : paint // ignore: cast_nullable_to_non_nullable
              as Paint,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DropletConfigImpl implements _DropletConfig {
  const _$DropletConfigImpl(
      {required this.density,
      required this.length,
      required this.angle,
      required this.paint,
      required this.time});

  @override
  final int density;
  @override
  final double length;
  @override
  final double angle;
  @override
  final Paint paint;
  @override
  final int time;

  @override
  String toString() {
    return 'DropletConfig(density: $density, length: $length, angle: $angle, paint: $paint, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DropletConfigImpl &&
            (identical(other.density, density) || other.density == density) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.angle, angle) || other.angle == angle) &&
            (identical(other.paint, paint) || other.paint == paint) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, density, length, angle, paint, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DropletConfigImplCopyWith<_$DropletConfigImpl> get copyWith =>
      __$$DropletConfigImplCopyWithImpl<_$DropletConfigImpl>(this, _$identity);
}

abstract class _DropletConfig implements DropletConfig {
  const factory _DropletConfig(
      {required final int density,
      required final double length,
      required final double angle,
      required final Paint paint,
      required final int time}) = _$DropletConfigImpl;

  @override
  int get density;
  @override
  double get length;
  @override
  double get angle;
  @override
  Paint get paint;
  @override
  int get time;
  @override
  @JsonKey(ignore: true)
  _$$DropletConfigImplCopyWith<_$DropletConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
