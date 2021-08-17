// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'delivery_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DeliveryDetailTearOff {
  const _$DeliveryDetailTearOff();

  _DeliveryDetail call(
      {LatLng? position,
      String? geocodedPosition,
      String? address,
      Directions? directions}) {
    return _DeliveryDetail(
      position: position,
      geocodedPosition: geocodedPosition,
      address: address,
      directions: directions,
    );
  }
}

/// @nodoc
const $DeliveryDetail = _$DeliveryDetailTearOff();

/// @nodoc
mixin _$DeliveryDetail {
  LatLng? get position => throw _privateConstructorUsedError;
  String? get geocodedPosition => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  Directions? get directions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeliveryDetailCopyWith<DeliveryDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryDetailCopyWith<$Res> {
  factory $DeliveryDetailCopyWith(
          DeliveryDetail value, $Res Function(DeliveryDetail) then) =
      _$DeliveryDetailCopyWithImpl<$Res>;
  $Res call(
      {LatLng? position,
      String? geocodedPosition,
      String? address,
      Directions? directions});

  $DirectionsCopyWith<$Res>? get directions;
}

/// @nodoc
class _$DeliveryDetailCopyWithImpl<$Res>
    implements $DeliveryDetailCopyWith<$Res> {
  _$DeliveryDetailCopyWithImpl(this._value, this._then);

  final DeliveryDetail _value;
  // ignore: unused_field
  final $Res Function(DeliveryDetail) _then;

  @override
  $Res call({
    Object? position = freezed,
    Object? geocodedPosition = freezed,
    Object? address = freezed,
    Object? directions = freezed,
  }) {
    return _then(_value.copyWith(
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      geocodedPosition: geocodedPosition == freezed
          ? _value.geocodedPosition
          : geocodedPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      directions: directions == freezed
          ? _value.directions
          : directions // ignore: cast_nullable_to_non_nullable
              as Directions?,
    ));
  }

  @override
  $DirectionsCopyWith<$Res>? get directions {
    if (_value.directions == null) {
      return null;
    }

    return $DirectionsCopyWith<$Res>(_value.directions!, (value) {
      return _then(_value.copyWith(directions: value));
    });
  }
}

/// @nodoc
abstract class _$DeliveryDetailCopyWith<$Res>
    implements $DeliveryDetailCopyWith<$Res> {
  factory _$DeliveryDetailCopyWith(
          _DeliveryDetail value, $Res Function(_DeliveryDetail) then) =
      __$DeliveryDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {LatLng? position,
      String? geocodedPosition,
      String? address,
      Directions? directions});

  @override
  $DirectionsCopyWith<$Res>? get directions;
}

/// @nodoc
class __$DeliveryDetailCopyWithImpl<$Res>
    extends _$DeliveryDetailCopyWithImpl<$Res>
    implements _$DeliveryDetailCopyWith<$Res> {
  __$DeliveryDetailCopyWithImpl(
      _DeliveryDetail _value, $Res Function(_DeliveryDetail) _then)
      : super(_value, (v) => _then(v as _DeliveryDetail));

  @override
  _DeliveryDetail get _value => super._value as _DeliveryDetail;

  @override
  $Res call({
    Object? position = freezed,
    Object? geocodedPosition = freezed,
    Object? address = freezed,
    Object? directions = freezed,
  }) {
    return _then(_DeliveryDetail(
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      geocodedPosition: geocodedPosition == freezed
          ? _value.geocodedPosition
          : geocodedPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      directions: directions == freezed
          ? _value.directions
          : directions // ignore: cast_nullable_to_non_nullable
              as Directions?,
    ));
  }
}

/// @nodoc

class _$_DeliveryDetail extends _DeliveryDetail {
  _$_DeliveryDetail(
      {this.position, this.geocodedPosition, this.address, this.directions})
      : super._();

  @override
  final LatLng? position;
  @override
  final String? geocodedPosition;
  @override
  final String? address;
  @override
  final Directions? directions;

  @override
  String toString() {
    return 'DeliveryDetail(position: $position, geocodedPosition: $geocodedPosition, address: $address, directions: $directions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeliveryDetail &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.geocodedPosition, geocodedPosition) ||
                const DeepCollectionEquality()
                    .equals(other.geocodedPosition, geocodedPosition)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.directions, directions) ||
                const DeepCollectionEquality()
                    .equals(other.directions, directions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(geocodedPosition) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(directions);

  @JsonKey(ignore: true)
  @override
  _$DeliveryDetailCopyWith<_DeliveryDetail> get copyWith =>
      __$DeliveryDetailCopyWithImpl<_DeliveryDetail>(this, _$identity);
}

abstract class _DeliveryDetail extends DeliveryDetail {
  factory _DeliveryDetail(
      {LatLng? position,
      String? geocodedPosition,
      String? address,
      Directions? directions}) = _$_DeliveryDetail;
  _DeliveryDetail._() : super._();

  @override
  LatLng? get position => throw _privateConstructorUsedError;
  @override
  String? get geocodedPosition => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  Directions? get directions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DeliveryDetailCopyWith<_DeliveryDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
