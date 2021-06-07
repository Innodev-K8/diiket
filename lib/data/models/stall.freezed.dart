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
      {@HiveField(0) int? id,
      @HiveField(1) Seller? seller,
      @HiveField(2) int? market_id,
      @HiveField(3) bool? is_open,
      @HiveField(4) String? name,
      @HiveField(5) String? description,
      @HiveField(6) String? photo_url,
      @HiveField(7) List<Product>? products,
      @HiveField(8) String? location_block,
      @HiveField(9) String? location_number,
      @HiveField(10) String? location_floor,
      @HiveField(11) String? location_detail,
      @HiveField(12) String? location_lat,
      @HiveField(13) String? location_lng,
      @HiveField(14) int? verified_at}) {
    return _Stall(
      id: id,
      seller: seller,
      market_id: market_id,
      is_open: is_open,
      name: name,
      description: description,
      photo_url: photo_url,
      products: products,
      location_block: location_block,
      location_number: location_number,
      location_floor: location_floor,
      location_detail: location_detail,
      location_lat: location_lat,
      location_lng: location_lng,
      verified_at: verified_at,
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
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  Seller? get seller => throw _privateConstructorUsedError;
  @HiveField(2)
  int? get market_id => throw _privateConstructorUsedError;
  @HiveField(3)
  bool? get is_open => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get photo_url => throw _privateConstructorUsedError;
  @HiveField(7)
  List<Product>? get products => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get location_block => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get location_number => throw _privateConstructorUsedError;
  @HiveField(10)
  String? get location_floor => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get location_detail => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get location_lat => throw _privateConstructorUsedError;
  @HiveField(13)
  String? get location_lng => throw _privateConstructorUsedError;
  @HiveField(14)
  int? get verified_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StallCopyWith<Stall> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StallCopyWith<$Res> {
  factory $StallCopyWith(Stall value, $Res Function(Stall) then) =
      _$StallCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) Seller? seller,
      @HiveField(2) int? market_id,
      @HiveField(3) bool? is_open,
      @HiveField(4) String? name,
      @HiveField(5) String? description,
      @HiveField(6) String? photo_url,
      @HiveField(7) List<Product>? products,
      @HiveField(8) String? location_block,
      @HiveField(9) String? location_number,
      @HiveField(10) String? location_floor,
      @HiveField(11) String? location_detail,
      @HiveField(12) String? location_lat,
      @HiveField(13) String? location_lng,
      @HiveField(14) int? verified_at});

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
    Object? market_id = freezed,
    Object? is_open = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? photo_url = freezed,
    Object? products = freezed,
    Object? location_block = freezed,
    Object? location_number = freezed,
    Object? location_floor = freezed,
    Object? location_detail = freezed,
    Object? location_lat = freezed,
    Object? location_lng = freezed,
    Object? verified_at = freezed,
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
      market_id: market_id == freezed
          ? _value.market_id
          : market_id // ignore: cast_nullable_to_non_nullable
              as int?,
      is_open: is_open == freezed
          ? _value.is_open
          : is_open // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photo_url: photo_url == freezed
          ? _value.photo_url
          : photo_url // ignore: cast_nullable_to_non_nullable
              as String?,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      location_block: location_block == freezed
          ? _value.location_block
          : location_block // ignore: cast_nullable_to_non_nullable
              as String?,
      location_number: location_number == freezed
          ? _value.location_number
          : location_number // ignore: cast_nullable_to_non_nullable
              as String?,
      location_floor: location_floor == freezed
          ? _value.location_floor
          : location_floor // ignore: cast_nullable_to_non_nullable
              as String?,
      location_detail: location_detail == freezed
          ? _value.location_detail
          : location_detail // ignore: cast_nullable_to_non_nullable
              as String?,
      location_lat: location_lat == freezed
          ? _value.location_lat
          : location_lat // ignore: cast_nullable_to_non_nullable
              as String?,
      location_lng: location_lng == freezed
          ? _value.location_lng
          : location_lng // ignore: cast_nullable_to_non_nullable
              as String?,
      verified_at: verified_at == freezed
          ? _value.verified_at
          : verified_at // ignore: cast_nullable_to_non_nullable
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
      {@HiveField(0) int? id,
      @HiveField(1) Seller? seller,
      @HiveField(2) int? market_id,
      @HiveField(3) bool? is_open,
      @HiveField(4) String? name,
      @HiveField(5) String? description,
      @HiveField(6) String? photo_url,
      @HiveField(7) List<Product>? products,
      @HiveField(8) String? location_block,
      @HiveField(9) String? location_number,
      @HiveField(10) String? location_floor,
      @HiveField(11) String? location_detail,
      @HiveField(12) String? location_lat,
      @HiveField(13) String? location_lng,
      @HiveField(14) int? verified_at});

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
    Object? market_id = freezed,
    Object? is_open = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? photo_url = freezed,
    Object? products = freezed,
    Object? location_block = freezed,
    Object? location_number = freezed,
    Object? location_floor = freezed,
    Object? location_detail = freezed,
    Object? location_lat = freezed,
    Object? location_lng = freezed,
    Object? verified_at = freezed,
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
      market_id: market_id == freezed
          ? _value.market_id
          : market_id // ignore: cast_nullable_to_non_nullable
              as int?,
      is_open: is_open == freezed
          ? _value.is_open
          : is_open // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photo_url: photo_url == freezed
          ? _value.photo_url
          : photo_url // ignore: cast_nullable_to_non_nullable
              as String?,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      location_block: location_block == freezed
          ? _value.location_block
          : location_block // ignore: cast_nullable_to_non_nullable
              as String?,
      location_number: location_number == freezed
          ? _value.location_number
          : location_number // ignore: cast_nullable_to_non_nullable
              as String?,
      location_floor: location_floor == freezed
          ? _value.location_floor
          : location_floor // ignore: cast_nullable_to_non_nullable
              as String?,
      location_detail: location_detail == freezed
          ? _value.location_detail
          : location_detail // ignore: cast_nullable_to_non_nullable
              as String?,
      location_lat: location_lat == freezed
          ? _value.location_lat
          : location_lat // ignore: cast_nullable_to_non_nullable
              as String?,
      location_lng: location_lng == freezed
          ? _value.location_lng
          : location_lng // ignore: cast_nullable_to_non_nullable
              as String?,
      verified_at: verified_at == freezed
          ? _value.verified_at
          : verified_at // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'StallAdapter')
class _$_Stall implements _Stall {
  const _$_Stall(
      {@HiveField(0) this.id,
      @HiveField(1) this.seller,
      @HiveField(2) this.market_id,
      @HiveField(3) this.is_open,
      @HiveField(4) this.name,
      @HiveField(5) this.description,
      @HiveField(6) this.photo_url,
      @HiveField(7) this.products,
      @HiveField(8) this.location_block,
      @HiveField(9) this.location_number,
      @HiveField(10) this.location_floor,
      @HiveField(11) this.location_detail,
      @HiveField(12) this.location_lat,
      @HiveField(13) this.location_lng,
      @HiveField(14) this.verified_at});

  factory _$_Stall.fromJson(Map<String, dynamic> json) =>
      _$_$_StallFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final Seller? seller;
  @override
  @HiveField(2)
  final int? market_id;
  @override
  @HiveField(3)
  final bool? is_open;
  @override
  @HiveField(4)
  final String? name;
  @override
  @HiveField(5)
  final String? description;
  @override
  @HiveField(6)
  final String? photo_url;
  @override
  @HiveField(7)
  final List<Product>? products;
  @override
  @HiveField(8)
  final String? location_block;
  @override
  @HiveField(9)
  final String? location_number;
  @override
  @HiveField(10)
  final String? location_floor;
  @override
  @HiveField(11)
  final String? location_detail;
  @override
  @HiveField(12)
  final String? location_lat;
  @override
  @HiveField(13)
  final String? location_lng;
  @override
  @HiveField(14)
  final int? verified_at;

  @override
  String toString() {
    return 'Stall(id: $id, seller: $seller, market_id: $market_id, is_open: $is_open, name: $name, description: $description, photo_url: $photo_url, products: $products, location_block: $location_block, location_number: $location_number, location_floor: $location_floor, location_detail: $location_detail, location_lat: $location_lat, location_lng: $location_lng, verified_at: $verified_at)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Stall &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.seller, seller) ||
                const DeepCollectionEquality().equals(other.seller, seller)) &&
            (identical(other.market_id, market_id) ||
                const DeepCollectionEquality()
                    .equals(other.market_id, market_id)) &&
            (identical(other.is_open, is_open) ||
                const DeepCollectionEquality()
                    .equals(other.is_open, is_open)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.photo_url, photo_url) ||
                const DeepCollectionEquality()
                    .equals(other.photo_url, photo_url)) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)) &&
            (identical(other.location_block, location_block) ||
                const DeepCollectionEquality()
                    .equals(other.location_block, location_block)) &&
            (identical(other.location_number, location_number) ||
                const DeepCollectionEquality()
                    .equals(other.location_number, location_number)) &&
            (identical(other.location_floor, location_floor) ||
                const DeepCollectionEquality()
                    .equals(other.location_floor, location_floor)) &&
            (identical(other.location_detail, location_detail) ||
                const DeepCollectionEquality()
                    .equals(other.location_detail, location_detail)) &&
            (identical(other.location_lat, location_lat) ||
                const DeepCollectionEquality()
                    .equals(other.location_lat, location_lat)) &&
            (identical(other.location_lng, location_lng) ||
                const DeepCollectionEquality()
                    .equals(other.location_lng, location_lng)) &&
            (identical(other.verified_at, verified_at) ||
                const DeepCollectionEquality()
                    .equals(other.verified_at, verified_at)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(seller) ^
      const DeepCollectionEquality().hash(market_id) ^
      const DeepCollectionEquality().hash(is_open) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(photo_url) ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(location_block) ^
      const DeepCollectionEquality().hash(location_number) ^
      const DeepCollectionEquality().hash(location_floor) ^
      const DeepCollectionEquality().hash(location_detail) ^
      const DeepCollectionEquality().hash(location_lat) ^
      const DeepCollectionEquality().hash(location_lng) ^
      const DeepCollectionEquality().hash(verified_at);

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
      {@HiveField(0) int? id,
      @HiveField(1) Seller? seller,
      @HiveField(2) int? market_id,
      @HiveField(3) bool? is_open,
      @HiveField(4) String? name,
      @HiveField(5) String? description,
      @HiveField(6) String? photo_url,
      @HiveField(7) List<Product>? products,
      @HiveField(8) String? location_block,
      @HiveField(9) String? location_number,
      @HiveField(10) String? location_floor,
      @HiveField(11) String? location_detail,
      @HiveField(12) String? location_lat,
      @HiveField(13) String? location_lng,
      @HiveField(14) int? verified_at}) = _$_Stall;

  factory _Stall.fromJson(Map<String, dynamic> json) = _$_Stall.fromJson;

  @override
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  Seller? get seller => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  int? get market_id => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  bool? get is_open => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String? get name => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String? get description => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  String? get photo_url => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  List<Product>? get products => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  String? get location_block => throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  String? get location_number => throw _privateConstructorUsedError;
  @override
  @HiveField(10)
  String? get location_floor => throw _privateConstructorUsedError;
  @override
  @HiveField(11)
  String? get location_detail => throw _privateConstructorUsedError;
  @override
  @HiveField(12)
  String? get location_lat => throw _privateConstructorUsedError;
  @override
  @HiveField(13)
  String? get location_lng => throw _privateConstructorUsedError;
  @override
  @HiveField(14)
  int? get verified_at => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StallCopyWith<_Stall> get copyWith => throw _privateConstructorUsedError;
}
