// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'directions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DirectionsTearOff {
  const _$DirectionsTearOff();

  _Directions call(
      {LatLngBounds? bounds,
      List<PointLatLng>? polylinePoints,
      int? totalDistance,
      int? totalDuration,
      Placemark? placemark}) {
    return _Directions(
      bounds: bounds,
      polylinePoints: polylinePoints,
      totalDistance: totalDistance,
      totalDuration: totalDuration,
      placemark: placemark,
    );
  }
}

/// @nodoc
const $Directions = _$DirectionsTearOff();

/// @nodoc
mixin _$Directions {
  LatLngBounds? get bounds => throw _privateConstructorUsedError;
  List<PointLatLng>? get polylinePoints => throw _privateConstructorUsedError;
  int? get totalDistance => throw _privateConstructorUsedError;
  int? get totalDuration => throw _privateConstructorUsedError;
  Placemark? get placemark => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DirectionsCopyWith<Directions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectionsCopyWith<$Res> {
  factory $DirectionsCopyWith(
          Directions value, $Res Function(Directions) then) =
      _$DirectionsCopyWithImpl<$Res>;
  $Res call(
      {LatLngBounds? bounds,
      List<PointLatLng>? polylinePoints,
      int? totalDistance,
      int? totalDuration,
      Placemark? placemark});
}

/// @nodoc
class _$DirectionsCopyWithImpl<$Res> implements $DirectionsCopyWith<$Res> {
  _$DirectionsCopyWithImpl(this._value, this._then);

  final Directions _value;
  // ignore: unused_field
  final $Res Function(Directions) _then;

  @override
  $Res call({
    Object? bounds = freezed,
    Object? polylinePoints = freezed,
    Object? totalDistance = freezed,
    Object? totalDuration = freezed,
    Object? placemark = freezed,
  }) {
    return _then(_value.copyWith(
      bounds: bounds == freezed
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as LatLngBounds?,
      polylinePoints: polylinePoints == freezed
          ? _value.polylinePoints
          : polylinePoints // ignore: cast_nullable_to_non_nullable
              as List<PointLatLng>?,
      totalDistance: totalDistance == freezed
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDuration: totalDuration == freezed
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      placemark: placemark == freezed
          ? _value.placemark
          : placemark // ignore: cast_nullable_to_non_nullable
              as Placemark?,
    ));
  }
}

/// @nodoc
abstract class _$DirectionsCopyWith<$Res> implements $DirectionsCopyWith<$Res> {
  factory _$DirectionsCopyWith(
          _Directions value, $Res Function(_Directions) then) =
      __$DirectionsCopyWithImpl<$Res>;
  @override
  $Res call(
      {LatLngBounds? bounds,
      List<PointLatLng>? polylinePoints,
      int? totalDistance,
      int? totalDuration,
      Placemark? placemark});
}

/// @nodoc
class __$DirectionsCopyWithImpl<$Res> extends _$DirectionsCopyWithImpl<$Res>
    implements _$DirectionsCopyWith<$Res> {
  __$DirectionsCopyWithImpl(
      _Directions _value, $Res Function(_Directions) _then)
      : super(_value, (v) => _then(v as _Directions));

  @override
  _Directions get _value => super._value as _Directions;

  @override
  $Res call({
    Object? bounds = freezed,
    Object? polylinePoints = freezed,
    Object? totalDistance = freezed,
    Object? totalDuration = freezed,
    Object? placemark = freezed,
  }) {
    return _then(_Directions(
      bounds: bounds == freezed
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as LatLngBounds?,
      polylinePoints: polylinePoints == freezed
          ? _value.polylinePoints
          : polylinePoints // ignore: cast_nullable_to_non_nullable
              as List<PointLatLng>?,
      totalDistance: totalDistance == freezed
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDuration: totalDuration == freezed
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      placemark: placemark == freezed
          ? _value.placemark
          : placemark // ignore: cast_nullable_to_non_nullable
              as Placemark?,
    ));
  }
}

/// @nodoc

class _$_Directions extends _Directions {
  _$_Directions(
      {this.bounds,
      this.polylinePoints,
      this.totalDistance,
      this.totalDuration,
      this.placemark})
      : super._();

  @override
  final LatLngBounds? bounds;
  @override
  final List<PointLatLng>? polylinePoints;
  @override
  final int? totalDistance;
  @override
  final int? totalDuration;
  @override
  final Placemark? placemark;

  @override
  String toString() {
    return 'Directions(bounds: $bounds, polylinePoints: $polylinePoints, totalDistance: $totalDistance, totalDuration: $totalDuration, placemark: $placemark)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Directions &&
            (identical(other.bounds, bounds) ||
                const DeepCollectionEquality().equals(other.bounds, bounds)) &&
            (identical(other.polylinePoints, polylinePoints) ||
                const DeepCollectionEquality()
                    .equals(other.polylinePoints, polylinePoints)) &&
            (identical(other.totalDistance, totalDistance) ||
                const DeepCollectionEquality()
                    .equals(other.totalDistance, totalDistance)) &&
            (identical(other.totalDuration, totalDuration) ||
                const DeepCollectionEquality()
                    .equals(other.totalDuration, totalDuration)) &&
            (identical(other.placemark, placemark) ||
                const DeepCollectionEquality()
                    .equals(other.placemark, placemark)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bounds) ^
      const DeepCollectionEquality().hash(polylinePoints) ^
      const DeepCollectionEquality().hash(totalDistance) ^
      const DeepCollectionEquality().hash(totalDuration) ^
      const DeepCollectionEquality().hash(placemark);

  @JsonKey(ignore: true)
  @override
  _$DirectionsCopyWith<_Directions> get copyWith =>
      __$DirectionsCopyWithImpl<_Directions>(this, _$identity);
}

abstract class _Directions extends Directions {
  factory _Directions(
      {LatLngBounds? bounds,
      List<PointLatLng>? polylinePoints,
      int? totalDistance,
      int? totalDuration,
      Placemark? placemark}) = _$_Directions;
  _Directions._() : super._();

  @override
  LatLngBounds? get bounds => throw _privateConstructorUsedError;
  @override
  List<PointLatLng>? get polylinePoints => throw _privateConstructorUsedError;
  @override
  int? get totalDistance => throw _privateConstructorUsedError;
  @override
  int? get totalDuration => throw _privateConstructorUsedError;
  @override
  Placemark? get placemark => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DirectionsCopyWith<_Directions> get copyWith =>
      throw _privateConstructorUsedError;
}
