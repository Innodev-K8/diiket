// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'stall.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stall _$StallFromJson(Map<String, dynamic> json) {
  return _Stall.fromJson(json);
}

/// @nodoc
class _$StallTearOff {
  const _$StallTearOff();

  _Stall call(
      {int? id,
      Seller? seller,
      int? marketId,
      bool? isOpen,
      String? name,
      String? description,
      String? photo,
      String? locationBlock,
      String? locationNumber,
      String? locationFloor,
      String? locationDetail,
      String? locationLat,
      String? locationLng,
      int? verifiedAt}) {
    return _Stall(
      id: id,
      seller: seller,
      marketId: marketId,
      isOpen: isOpen,
      name: name,
      description: description,
      photo: photo,
      locationBlock: locationBlock,
      locationNumber: locationNumber,
      locationFloor: locationFloor,
      locationDetail: locationDetail,
      locationLat: locationLat,
      locationLng: locationLng,
      verifiedAt: verifiedAt,
    );
  }

  Stall fromJson(Map<String, Object> json) {
    return Stall.fromJson(json);
  }
}

/// @nodoc
const $Stall = _$StallTearOff();

/// @nodoc
mixin _$Stall {
  int? get id => throw _privateConstructorUsedError;
  Seller? get seller => throw _privateConstructorUsedError;
  int? get marketId => throw _privateConstructorUsedError;
  bool? get isOpen => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String? get locationBlock => throw _privateConstructorUsedError;
  String? get locationNumber => throw _privateConstructorUsedError;
  String? get locationFloor => throw _privateConstructorUsedError;
  String? get locationDetail => throw _privateConstructorUsedError;
  String? get locationLat => throw _privateConstructorUsedError;
  String? get locationLng => throw _privateConstructorUsedError;
  int? get verifiedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StallCopyWith<Stall> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StallCopyWith<$Res> {
  factory $StallCopyWith(Stall value, $Res Function(Stall) then) =
      _$StallCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      Seller? seller,
      int? marketId,
      bool? isOpen,
      String? name,
      String? description,
      String? photo,
      String? locationBlock,
      String? locationNumber,
      String? locationFloor,
      String? locationDetail,
      String? locationLat,
      String? locationLng,
      int? verifiedAt});

  $SellerCopyWith<$Res>? get seller;
}

/// @nodoc
class _$StallCopyWithImpl<$Res> implements $StallCopyWith<$Res> {
  _$StallCopyWithImpl(this._value, this._then);

  final Stall _value;
  // ignore: unused_field
  final $Res Function(Stall) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? seller = freezed,
    Object? marketId = freezed,
    Object? isOpen = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? photo = freezed,
    Object? locationBlock = freezed,
    Object? locationNumber = freezed,
    Object? locationFloor = freezed,
    Object? locationDetail = freezed,
    Object? locationLat = freezed,
    Object? locationLng = freezed,
    Object? verifiedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      seller: seller == freezed
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as Seller?,
      marketId: marketId == freezed
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as int?,
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      locationBlock: locationBlock == freezed
          ? _value.locationBlock
          : locationBlock // ignore: cast_nullable_to_non_nullable
              as String?,
      locationNumber: locationNumber == freezed
          ? _value.locationNumber
          : locationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      locationFloor: locationFloor == freezed
          ? _value.locationFloor
          : locationFloor // ignore: cast_nullable_to_non_nullable
              as String?,
      locationDetail: locationDetail == freezed
          ? _value.locationDetail
          : locationDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLat: locationLat == freezed
          ? _value.locationLat
          : locationLat // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLng: locationLng == freezed
          ? _value.locationLng
          : locationLng // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedAt: verifiedAt == freezed
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $SellerCopyWith<$Res>? get seller {
    if (_value.seller == null) {
      return null;
    }

    return $SellerCopyWith<$Res>(_value.seller!, (value) {
      return _then(_value.copyWith(seller: value));
    });
  }
}

/// @nodoc
abstract class _$StallCopyWith<$Res> implements $StallCopyWith<$Res> {
  factory _$StallCopyWith(_Stall value, $Res Function(_Stall) then) =
      __$StallCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      Seller? seller,
      int? marketId,
      bool? isOpen,
      String? name,
      String? description,
      String? photo,
      String? locationBlock,
      String? locationNumber,
      String? locationFloor,
      String? locationDetail,
      String? locationLat,
      String? locationLng,
      int? verifiedAt});

  @override
  $SellerCopyWith<$Res>? get seller;
}

/// @nodoc
class __$StallCopyWithImpl<$Res> extends _$StallCopyWithImpl<$Res>
    implements _$StallCopyWith<$Res> {
  __$StallCopyWithImpl(_Stall _value, $Res Function(_Stall) _then)
      : super(_value, (v) => _then(v as _Stall));

  @override
  _Stall get _value => super._value as _Stall;

  @override
  $Res call({
    Object? id = freezed,
    Object? seller = freezed,
    Object? marketId = freezed,
    Object? isOpen = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? photo = freezed,
    Object? locationBlock = freezed,
    Object? locationNumber = freezed,
    Object? locationFloor = freezed,
    Object? locationDetail = freezed,
    Object? locationLat = freezed,
    Object? locationLng = freezed,
    Object? verifiedAt = freezed,
  }) {
    return _then(_Stall(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      seller: seller == freezed
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as Seller?,
      marketId: marketId == freezed
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as int?,
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      locationBlock: locationBlock == freezed
          ? _value.locationBlock
          : locationBlock // ignore: cast_nullable_to_non_nullable
              as String?,
      locationNumber: locationNumber == freezed
          ? _value.locationNumber
          : locationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      locationFloor: locationFloor == freezed
          ? _value.locationFloor
          : locationFloor // ignore: cast_nullable_to_non_nullable
              as String?,
      locationDetail: locationDetail == freezed
          ? _value.locationDetail
          : locationDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLat: locationLat == freezed
          ? _value.locationLat
          : locationLat // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLng: locationLng == freezed
          ? _value.locationLng
          : locationLng // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedAt: verifiedAt == freezed
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stall implements _Stall {
  const _$_Stall(
      {this.id,
      this.seller,
      this.marketId,
      this.isOpen,
      this.name,
      this.description,
      this.photo,
      this.locationBlock,
      this.locationNumber,
      this.locationFloor,
      this.locationDetail,
      this.locationLat,
      this.locationLng,
      this.verifiedAt});

  factory _$_Stall.fromJson(Map<String, dynamic> json) =>
      _$_$_StallFromJson(json);

  @override
  final int? id;
  @override
  final Seller? seller;
  @override
  final int? marketId;
  @override
  final bool? isOpen;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? photo;
  @override
  final String? locationBlock;
  @override
  final String? locationNumber;
  @override
  final String? locationFloor;
  @override
  final String? locationDetail;
  @override
  final String? locationLat;
  @override
  final String? locationLng;
  @override
  final int? verifiedAt;

  @override
  String toString() {
    return 'Stall(id: $id, seller: $seller, marketId: $marketId, isOpen: $isOpen, name: $name, description: $description, photo: $photo, locationBlock: $locationBlock, locationNumber: $locationNumber, locationFloor: $locationFloor, locationDetail: $locationDetail, locationLat: $locationLat, locationLng: $locationLng, verifiedAt: $verifiedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Stall &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.seller, seller) ||
                const DeepCollectionEquality().equals(other.seller, seller)) &&
            (identical(other.marketId, marketId) ||
                const DeepCollectionEquality()
                    .equals(other.marketId, marketId)) &&
            (identical(other.isOpen, isOpen) ||
                const DeepCollectionEquality().equals(other.isOpen, isOpen)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.locationBlock, locationBlock) ||
                const DeepCollectionEquality()
                    .equals(other.locationBlock, locationBlock)) &&
            (identical(other.locationNumber, locationNumber) ||
                const DeepCollectionEquality()
                    .equals(other.locationNumber, locationNumber)) &&
            (identical(other.locationFloor, locationFloor) ||
                const DeepCollectionEquality()
                    .equals(other.locationFloor, locationFloor)) &&
            (identical(other.locationDetail, locationDetail) ||
                const DeepCollectionEquality()
                    .equals(other.locationDetail, locationDetail)) &&
            (identical(other.locationLat, locationLat) ||
                const DeepCollectionEquality()
                    .equals(other.locationLat, locationLat)) &&
            (identical(other.locationLng, locationLng) ||
                const DeepCollectionEquality()
                    .equals(other.locationLng, locationLng)) &&
            (identical(other.verifiedAt, verifiedAt) ||
                const DeepCollectionEquality()
                    .equals(other.verifiedAt, verifiedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(seller) ^
      const DeepCollectionEquality().hash(marketId) ^
      const DeepCollectionEquality().hash(isOpen) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(locationBlock) ^
      const DeepCollectionEquality().hash(locationNumber) ^
      const DeepCollectionEquality().hash(locationFloor) ^
      const DeepCollectionEquality().hash(locationDetail) ^
      const DeepCollectionEquality().hash(locationLat) ^
      const DeepCollectionEquality().hash(locationLng) ^
      const DeepCollectionEquality().hash(verifiedAt);

  @JsonKey(ignore: true)
  @override
  _$StallCopyWith<_Stall> get copyWith =>
      __$StallCopyWithImpl<_Stall>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StallToJson(this);
  }
}

abstract class _Stall implements Stall {
  const factory _Stall(
      {int? id,
      Seller? seller,
      int? marketId,
      bool? isOpen,
      String? name,
      String? description,
      String? photo,
      String? locationBlock,
      String? locationNumber,
      String? locationFloor,
      String? locationDetail,
      String? locationLat,
      String? locationLng,
      int? verifiedAt}) = _$_Stall;

  factory _Stall.fromJson(Map<String, dynamic> json) = _$_Stall.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  Seller? get seller => throw _privateConstructorUsedError;
  @override
  int? get marketId => throw _privateConstructorUsedError;
  @override
  bool? get isOpen => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get photo => throw _privateConstructorUsedError;
  @override
  String? get locationBlock => throw _privateConstructorUsedError;
  @override
  String? get locationNumber => throw _privateConstructorUsedError;
  @override
  String? get locationFloor => throw _privateConstructorUsedError;
  @override
  String? get locationDetail => throw _privateConstructorUsedError;
  @override
  String? get locationLat => throw _privateConstructorUsedError;
  @override
  String? get locationLng => throw _privateConstructorUsedError;
  @override
  int? get verifiedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StallCopyWith<_Stall> get copyWith => throw _privateConstructorUsedError;
}
