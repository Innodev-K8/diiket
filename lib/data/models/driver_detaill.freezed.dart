// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'driver_detaill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DriverDetaill _$DriverDetaillFromJson(Map<String, dynamic> json) {
  return _DriverDetaill.fromJson(json);
}

/// @nodoc
class _$DriverDetaillTearOff {
  const _$DriverDetaillTearOff();

  _DriverDetaill call(
      {int? id,
      int? user_id,
      int? market_id,
      int? verified_at,
      String? vehicle_name,
      String? vehicle_number}) {
    return _DriverDetaill(
      id: id,
      user_id: user_id,
      market_id: market_id,
      verified_at: verified_at,
      vehicle_name: vehicle_name,
      vehicle_number: vehicle_number,
    );
  }

  DriverDetaill fromJson(Map<String, Object> json) {
    return DriverDetaill.fromJson(json);
  }
}

/// @nodoc
const $DriverDetaill = _$DriverDetaillTearOff();

/// @nodoc
mixin _$DriverDetaill {
  int? get id => throw _privateConstructorUsedError;
  int? get user_id => throw _privateConstructorUsedError;
  int? get market_id => throw _privateConstructorUsedError;
  int? get verified_at => throw _privateConstructorUsedError;
  String? get vehicle_name => throw _privateConstructorUsedError;
  String? get vehicle_number => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriverDetaillCopyWith<DriverDetaill> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverDetaillCopyWith<$Res> {
  factory $DriverDetaillCopyWith(
          DriverDetaill value, $Res Function(DriverDetaill) then) =
      _$DriverDetaillCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      int? user_id,
      int? market_id,
      int? verified_at,
      String? vehicle_name,
      String? vehicle_number});
}

/// @nodoc
class _$DriverDetaillCopyWithImpl<$Res>
    implements $DriverDetaillCopyWith<$Res> {
  _$DriverDetaillCopyWithImpl(this._value, this._then);

  final DriverDetaill _value;
  // ignore: unused_field
  final $Res Function(DriverDetaill) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user_id = freezed,
    Object? market_id = freezed,
    Object? verified_at = freezed,
    Object? vehicle_name = freezed,
    Object? vehicle_number = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      market_id: market_id == freezed
          ? _value.market_id
          : market_id // ignore: cast_nullable_to_non_nullable
              as int?,
      verified_at: verified_at == freezed
          ? _value.verified_at
          : verified_at // ignore: cast_nullable_to_non_nullable
              as int?,
      vehicle_name: vehicle_name == freezed
          ? _value.vehicle_name
          : vehicle_name // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicle_number: vehicle_number == freezed
          ? _value.vehicle_number
          : vehicle_number // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$DriverDetaillCopyWith<$Res>
    implements $DriverDetaillCopyWith<$Res> {
  factory _$DriverDetaillCopyWith(
          _DriverDetaill value, $Res Function(_DriverDetaill) then) =
      __$DriverDetaillCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      int? user_id,
      int? market_id,
      int? verified_at,
      String? vehicle_name,
      String? vehicle_number});
}

/// @nodoc
class __$DriverDetaillCopyWithImpl<$Res>
    extends _$DriverDetaillCopyWithImpl<$Res>
    implements _$DriverDetaillCopyWith<$Res> {
  __$DriverDetaillCopyWithImpl(
      _DriverDetaill _value, $Res Function(_DriverDetaill) _then)
      : super(_value, (v) => _then(v as _DriverDetaill));

  @override
  _DriverDetaill get _value => super._value as _DriverDetaill;

  @override
  $Res call({
    Object? id = freezed,
    Object? user_id = freezed,
    Object? market_id = freezed,
    Object? verified_at = freezed,
    Object? vehicle_name = freezed,
    Object? vehicle_number = freezed,
  }) {
    return _then(_DriverDetaill(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      market_id: market_id == freezed
          ? _value.market_id
          : market_id // ignore: cast_nullable_to_non_nullable
              as int?,
      verified_at: verified_at == freezed
          ? _value.verified_at
          : verified_at // ignore: cast_nullable_to_non_nullable
              as int?,
      vehicle_name: vehicle_name == freezed
          ? _value.vehicle_name
          : vehicle_name // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicle_number: vehicle_number == freezed
          ? _value.vehicle_number
          : vehicle_number // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DriverDetaill implements _DriverDetaill {
  _$_DriverDetaill(
      {this.id,
      this.user_id,
      this.market_id,
      this.verified_at,
      this.vehicle_name,
      this.vehicle_number});

  factory _$_DriverDetaill.fromJson(Map<String, dynamic> json) =>
      _$_$_DriverDetaillFromJson(json);

  @override
  final int? id;
  @override
  final int? user_id;
  @override
  final int? market_id;
  @override
  final int? verified_at;
  @override
  final String? vehicle_name;
  @override
  final String? vehicle_number;

  @override
  String toString() {
    return 'DriverDetaill(id: $id, user_id: $user_id, market_id: $market_id, verified_at: $verified_at, vehicle_name: $vehicle_name, vehicle_number: $vehicle_number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DriverDetaill &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user_id, user_id) ||
                const DeepCollectionEquality()
                    .equals(other.user_id, user_id)) &&
            (identical(other.market_id, market_id) ||
                const DeepCollectionEquality()
                    .equals(other.market_id, market_id)) &&
            (identical(other.verified_at, verified_at) ||
                const DeepCollectionEquality()
                    .equals(other.verified_at, verified_at)) &&
            (identical(other.vehicle_name, vehicle_name) ||
                const DeepCollectionEquality()
                    .equals(other.vehicle_name, vehicle_name)) &&
            (identical(other.vehicle_number, vehicle_number) ||
                const DeepCollectionEquality()
                    .equals(other.vehicle_number, vehicle_number)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user_id) ^
      const DeepCollectionEquality().hash(market_id) ^
      const DeepCollectionEquality().hash(verified_at) ^
      const DeepCollectionEquality().hash(vehicle_name) ^
      const DeepCollectionEquality().hash(vehicle_number);

  @JsonKey(ignore: true)
  @override
  _$DriverDetaillCopyWith<_DriverDetaill> get copyWith =>
      __$DriverDetaillCopyWithImpl<_DriverDetaill>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DriverDetaillToJson(this);
  }
}

abstract class _DriverDetaill implements DriverDetaill {
  factory _DriverDetaill(
      {int? id,
      int? user_id,
      int? market_id,
      int? verified_at,
      String? vehicle_name,
      String? vehicle_number}) = _$_DriverDetaill;

  factory _DriverDetaill.fromJson(Map<String, dynamic> json) =
      _$_DriverDetaill.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  int? get user_id => throw _privateConstructorUsedError;
  @override
  int? get market_id => throw _privateConstructorUsedError;
  @override
  int? get verified_at => throw _privateConstructorUsedError;
  @override
  String? get vehicle_name => throw _privateConstructorUsedError;
  @override
  String? get vehicle_number => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DriverDetaillCopyWith<_DriverDetaill> get copyWith =>
      throw _privateConstructorUsedError;
}
