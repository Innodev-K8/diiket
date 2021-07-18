// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'fee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Fee _$FeeFromJson(Map<String, dynamic> json) {
  return _Fee.fromJson(json);
}

/// @nodoc
class _$FeeTearOff {
  const _$FeeTearOff();

  _Fee call(
      {int? delivery_fee, int? pickup_fee, int? service_fee, int? total_fee}) {
    return _Fee(
      delivery_fee: delivery_fee,
      pickup_fee: pickup_fee,
      service_fee: service_fee,
      total_fee: total_fee,
    );
  }

  Fee fromJson(Map<String, Object> json) {
    return Fee.fromJson(json);
  }
}

/// @nodoc
const $Fee = _$FeeTearOff();

/// @nodoc
mixin _$Fee {
  int? get delivery_fee => throw _privateConstructorUsedError;
  int? get pickup_fee => throw _privateConstructorUsedError;
  int? get service_fee => throw _privateConstructorUsedError;
  int? get total_fee => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeeCopyWith<Fee> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeeCopyWith<$Res> {
  factory $FeeCopyWith(Fee value, $Res Function(Fee) then) =
      _$FeeCopyWithImpl<$Res>;
  $Res call(
      {int? delivery_fee, int? pickup_fee, int? service_fee, int? total_fee});
}

/// @nodoc
class _$FeeCopyWithImpl<$Res> implements $FeeCopyWith<$Res> {
  _$FeeCopyWithImpl(this._value, this._then);

  final Fee _value;
  // ignore: unused_field
  final $Res Function(Fee) _then;

  @override
  $Res call({
    Object? delivery_fee = freezed,
    Object? pickup_fee = freezed,
    Object? service_fee = freezed,
    Object? total_fee = freezed,
  }) {
    return _then(_value.copyWith(
      delivery_fee: delivery_fee == freezed
          ? _value.delivery_fee
          : delivery_fee // ignore: cast_nullable_to_non_nullable
              as int?,
      pickup_fee: pickup_fee == freezed
          ? _value.pickup_fee
          : pickup_fee // ignore: cast_nullable_to_non_nullable
              as int?,
      service_fee: service_fee == freezed
          ? _value.service_fee
          : service_fee // ignore: cast_nullable_to_non_nullable
              as int?,
      total_fee: total_fee == freezed
          ? _value.total_fee
          : total_fee // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$FeeCopyWith<$Res> implements $FeeCopyWith<$Res> {
  factory _$FeeCopyWith(_Fee value, $Res Function(_Fee) then) =
      __$FeeCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? delivery_fee, int? pickup_fee, int? service_fee, int? total_fee});
}

/// @nodoc
class __$FeeCopyWithImpl<$Res> extends _$FeeCopyWithImpl<$Res>
    implements _$FeeCopyWith<$Res> {
  __$FeeCopyWithImpl(_Fee _value, $Res Function(_Fee) _then)
      : super(_value, (v) => _then(v as _Fee));

  @override
  _Fee get _value => super._value as _Fee;

  @override
  $Res call({
    Object? delivery_fee = freezed,
    Object? pickup_fee = freezed,
    Object? service_fee = freezed,
    Object? total_fee = freezed,
  }) {
    return _then(_Fee(
      delivery_fee: delivery_fee == freezed
          ? _value.delivery_fee
          : delivery_fee // ignore: cast_nullable_to_non_nullable
              as int?,
      pickup_fee: pickup_fee == freezed
          ? _value.pickup_fee
          : pickup_fee // ignore: cast_nullable_to_non_nullable
              as int?,
      service_fee: service_fee == freezed
          ? _value.service_fee
          : service_fee // ignore: cast_nullable_to_non_nullable
              as int?,
      total_fee: total_fee == freezed
          ? _value.total_fee
          : total_fee // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Fee implements _Fee {
  _$_Fee(
      {this.delivery_fee, this.pickup_fee, this.service_fee, this.total_fee});

  factory _$_Fee.fromJson(Map<String, dynamic> json) => _$_$_FeeFromJson(json);

  @override
  final int? delivery_fee;
  @override
  final int? pickup_fee;
  @override
  final int? service_fee;
  @override
  final int? total_fee;

  @override
  String toString() {
    return 'Fee(delivery_fee: $delivery_fee, pickup_fee: $pickup_fee, service_fee: $service_fee, total_fee: $total_fee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Fee &&
            (identical(other.delivery_fee, delivery_fee) ||
                const DeepCollectionEquality()
                    .equals(other.delivery_fee, delivery_fee)) &&
            (identical(other.pickup_fee, pickup_fee) ||
                const DeepCollectionEquality()
                    .equals(other.pickup_fee, pickup_fee)) &&
            (identical(other.service_fee, service_fee) ||
                const DeepCollectionEquality()
                    .equals(other.service_fee, service_fee)) &&
            (identical(other.total_fee, total_fee) ||
                const DeepCollectionEquality()
                    .equals(other.total_fee, total_fee)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(delivery_fee) ^
      const DeepCollectionEquality().hash(pickup_fee) ^
      const DeepCollectionEquality().hash(service_fee) ^
      const DeepCollectionEquality().hash(total_fee);

  @JsonKey(ignore: true)
  @override
  _$FeeCopyWith<_Fee> get copyWith =>
      __$FeeCopyWithImpl<_Fee>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeeToJson(this);
  }
}

abstract class _Fee implements Fee {
  factory _Fee(
      {int? delivery_fee,
      int? pickup_fee,
      int? service_fee,
      int? total_fee}) = _$_Fee;

  factory _Fee.fromJson(Map<String, dynamic> json) = _$_Fee.fromJson;

  @override
  int? get delivery_fee => throw _privateConstructorUsedError;
  @override
  int? get pickup_fee => throw _privateConstructorUsedError;
  @override
  int? get service_fee => throw _privateConstructorUsedError;
  @override
  int? get total_fee => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FeeCopyWith<_Fee> get copyWith => throw _privateConstructorUsedError;
}
