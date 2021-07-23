// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'market.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Market _$MarketFromJson(Map<String, dynamic> json) {
  return _Market.fromJson(json);
}

/// @nodoc
class _$MarketTearOff {
  const _$MarketTearOff();

  _Market call(
      {int? id,
      String? name,
      String? address,
      @JsonKey(name: 'location_lat')
          String? locationLat,
      @JsonKey(name: 'location_lng')
          String? locationLng,
      @JsonKey(name: 'responsible_person_name')
          String? responsiblePersonName,
      @JsonKey(name: 'responsible_person_contact')
          String? responsiblePersonContact,
      @JsonKey(name: 'field_merchant_count')
          int? fieldMerchantCount,
      double? distance}) {
    return _Market(
      id: id,
      name: name,
      address: address,
      locationLat: locationLat,
      locationLng: locationLng,
      responsiblePersonName: responsiblePersonName,
      responsiblePersonContact: responsiblePersonContact,
      fieldMerchantCount: fieldMerchantCount,
      distance: distance,
    );
  }

  Market fromJson(Map<String, Object> json) {
    return Market.fromJson(json);
  }
}

/// @nodoc
const $Market = _$MarketTearOff();

/// @nodoc
mixin _$Market {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_lat')
  String? get locationLat => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_lng')
  String? get locationLng => throw _privateConstructorUsedError;
  @JsonKey(name: 'responsible_person_name')
  String? get responsiblePersonName => throw _privateConstructorUsedError;
  @JsonKey(name: 'responsible_person_contact')
  String? get responsiblePersonContact => throw _privateConstructorUsedError;
  @JsonKey(name: 'field_merchant_count')
  int? get fieldMerchantCount => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketCopyWith<Market> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketCopyWith<$Res> {
  factory $MarketCopyWith(Market value, $Res Function(Market) then) =
      _$MarketCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String? address,
      @JsonKey(name: 'location_lat')
          String? locationLat,
      @JsonKey(name: 'location_lng')
          String? locationLng,
      @JsonKey(name: 'responsible_person_name')
          String? responsiblePersonName,
      @JsonKey(name: 'responsible_person_contact')
          String? responsiblePersonContact,
      @JsonKey(name: 'field_merchant_count')
          int? fieldMerchantCount,
      double? distance});
}

/// @nodoc
class _$MarketCopyWithImpl<$Res> implements $MarketCopyWith<$Res> {
  _$MarketCopyWithImpl(this._value, this._then);

  final Market _value;
  // ignore: unused_field
  final $Res Function(Market) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? locationLat = freezed,
    Object? locationLng = freezed,
    Object? responsiblePersonName = freezed,
    Object? responsiblePersonContact = freezed,
    Object? fieldMerchantCount = freezed,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLat: locationLat == freezed
          ? _value.locationLat
          : locationLat // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLng: locationLng == freezed
          ? _value.locationLng
          : locationLng // ignore: cast_nullable_to_non_nullable
              as String?,
      responsiblePersonName: responsiblePersonName == freezed
          ? _value.responsiblePersonName
          : responsiblePersonName // ignore: cast_nullable_to_non_nullable
              as String?,
      responsiblePersonContact: responsiblePersonContact == freezed
          ? _value.responsiblePersonContact
          : responsiblePersonContact // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldMerchantCount: fieldMerchantCount == freezed
          ? _value.fieldMerchantCount
          : fieldMerchantCount // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$MarketCopyWith<$Res> implements $MarketCopyWith<$Res> {
  factory _$MarketCopyWith(_Market value, $Res Function(_Market) then) =
      __$MarketCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String? address,
      @JsonKey(name: 'location_lat')
          String? locationLat,
      @JsonKey(name: 'location_lng')
          String? locationLng,
      @JsonKey(name: 'responsible_person_name')
          String? responsiblePersonName,
      @JsonKey(name: 'responsible_person_contact')
          String? responsiblePersonContact,
      @JsonKey(name: 'field_merchant_count')
          int? fieldMerchantCount,
      double? distance});
}

/// @nodoc
class __$MarketCopyWithImpl<$Res> extends _$MarketCopyWithImpl<$Res>
    implements _$MarketCopyWith<$Res> {
  __$MarketCopyWithImpl(_Market _value, $Res Function(_Market) _then)
      : super(_value, (v) => _then(v as _Market));

  @override
  _Market get _value => super._value as _Market;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? locationLat = freezed,
    Object? locationLng = freezed,
    Object? responsiblePersonName = freezed,
    Object? responsiblePersonContact = freezed,
    Object? fieldMerchantCount = freezed,
    Object? distance = freezed,
  }) {
    return _then(_Market(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLat: locationLat == freezed
          ? _value.locationLat
          : locationLat // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLng: locationLng == freezed
          ? _value.locationLng
          : locationLng // ignore: cast_nullable_to_non_nullable
              as String?,
      responsiblePersonName: responsiblePersonName == freezed
          ? _value.responsiblePersonName
          : responsiblePersonName // ignore: cast_nullable_to_non_nullable
              as String?,
      responsiblePersonContact: responsiblePersonContact == freezed
          ? _value.responsiblePersonContact
          : responsiblePersonContact // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldMerchantCount: fieldMerchantCount == freezed
          ? _value.fieldMerchantCount
          : fieldMerchantCount // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Market implements _Market {
  const _$_Market(
      {this.id,
      this.name,
      this.address,
      @JsonKey(name: 'location_lat')
          this.locationLat,
      @JsonKey(name: 'location_lng')
          this.locationLng,
      @JsonKey(name: 'responsible_person_name')
          this.responsiblePersonName,
      @JsonKey(name: 'responsible_person_contact')
          this.responsiblePersonContact,
      @JsonKey(name: 'field_merchant_count')
          this.fieldMerchantCount,
      this.distance});

  factory _$_Market.fromJson(Map<String, dynamic> json) =>
      _$_$_MarketFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  @JsonKey(name: 'location_lat')
  final String? locationLat;
  @override
  @JsonKey(name: 'location_lng')
  final String? locationLng;
  @override
  @JsonKey(name: 'responsible_person_name')
  final String? responsiblePersonName;
  @override
  @JsonKey(name: 'responsible_person_contact')
  final String? responsiblePersonContact;
  @override
  @JsonKey(name: 'field_merchant_count')
  final int? fieldMerchantCount;
  @override
  final double? distance;

  @override
  String toString() {
    return 'Market(id: $id, name: $name, address: $address, locationLat: $locationLat, locationLng: $locationLng, responsiblePersonName: $responsiblePersonName, responsiblePersonContact: $responsiblePersonContact, fieldMerchantCount: $fieldMerchantCount, distance: $distance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Market &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.locationLat, locationLat) ||
                const DeepCollectionEquality()
                    .equals(other.locationLat, locationLat)) &&
            (identical(other.locationLng, locationLng) ||
                const DeepCollectionEquality()
                    .equals(other.locationLng, locationLng)) &&
            (identical(other.responsiblePersonName, responsiblePersonName) ||
                const DeepCollectionEquality().equals(
                    other.responsiblePersonName, responsiblePersonName)) &&
            (identical(
                    other.responsiblePersonContact, responsiblePersonContact) ||
                const DeepCollectionEquality().equals(
                    other.responsiblePersonContact,
                    responsiblePersonContact)) &&
            (identical(other.fieldMerchantCount, fieldMerchantCount) ||
                const DeepCollectionEquality()
                    .equals(other.fieldMerchantCount, fieldMerchantCount)) &&
            (identical(other.distance, distance) ||
                const DeepCollectionEquality()
                    .equals(other.distance, distance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(locationLat) ^
      const DeepCollectionEquality().hash(locationLng) ^
      const DeepCollectionEquality().hash(responsiblePersonName) ^
      const DeepCollectionEquality().hash(responsiblePersonContact) ^
      const DeepCollectionEquality().hash(fieldMerchantCount) ^
      const DeepCollectionEquality().hash(distance);

  @JsonKey(ignore: true)
  @override
  _$MarketCopyWith<_Market> get copyWith =>
      __$MarketCopyWithImpl<_Market>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MarketToJson(this);
  }
}

abstract class _Market implements Market {
  const factory _Market(
      {int? id,
      String? name,
      String? address,
      @JsonKey(name: 'location_lat')
          String? locationLat,
      @JsonKey(name: 'location_lng')
          String? locationLng,
      @JsonKey(name: 'responsible_person_name')
          String? responsiblePersonName,
      @JsonKey(name: 'responsible_person_contact')
          String? responsiblePersonContact,
      @JsonKey(name: 'field_merchant_count')
          int? fieldMerchantCount,
      double? distance}) = _$_Market;

  factory _Market.fromJson(Map<String, dynamic> json) = _$_Market.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'location_lat')
  String? get locationLat => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'location_lng')
  String? get locationLng => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'responsible_person_name')
  String? get responsiblePersonName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'responsible_person_contact')
  String? get responsiblePersonContact => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'field_merchant_count')
  int? get fieldMerchantCount => throw _privateConstructorUsedError;
  @override
  double? get distance => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MarketCopyWith<_Market> get copyWith => throw _privateConstructorUsedError;
}
