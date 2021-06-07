// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
class _$ProductTearOff {
  const _$ProductTearOff();

  _Product call(
      {@HiveField(0) int? id,
      @HiveField(1) int? stall_id,
      @HiveField(2) Stall? stall,
      @HiveField(3) String? name,
      @HiveField(4) String? description,
      @HiveField(5) String? photo_url,
      @HiveField(6) String? quantity_unit,
      @HiveField(7) int? weight,
      @HiveField(8) int? price,
      @HiveField(9) int? stocks,
      @HiveField(10) List<ProductCategory>? categories}) {
    return _Product(
      id: id,
      stall_id: stall_id,
      stall: stall,
      name: name,
      description: description,
      photo_url: photo_url,
      quantity_unit: quantity_unit,
      weight: weight,
      price: price,
      stocks: stocks,
      categories: categories,
    );
  }

  Product fromJson(Map<String, Object> json) {
    return Product.fromJson(json);
  }
}

/// @nodoc
const $Product = _$ProductTearOff();

/// @nodoc
mixin _$Product {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  int? get stall_id => throw _privateConstructorUsedError;
  @HiveField(2)
  Stall? get stall => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get photo_url => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get quantity_unit => throw _privateConstructorUsedError;
  @HiveField(7)
  int? get weight => throw _privateConstructorUsedError;
  @HiveField(8)
  int? get price => throw _privateConstructorUsedError;
  @HiveField(9)
  int? get stocks => throw _privateConstructorUsedError;
  @HiveField(10)
  List<ProductCategory>? get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) int? stall_id,
      @HiveField(2) Stall? stall,
      @HiveField(3) String? name,
      @HiveField(4) String? description,
      @HiveField(5) String? photo_url,
      @HiveField(6) String? quantity_unit,
      @HiveField(7) int? weight,
      @HiveField(8) int? price,
      @HiveField(9) int? stocks,
      @HiveField(10) List<ProductCategory>? categories});

  $StallCopyWith<$Res>? get stall;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? stall_id = freezed,
    Object? stall = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? photo_url = freezed,
    Object? quantity_unit = freezed,
    Object? weight = freezed,
    Object? price = freezed,
    Object? stocks = freezed,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stall_id: stall_id == freezed
          ? _value.stall_id
          : stall_id // ignore: cast_nullable_to_non_nullable
              as int?,
      stall: stall == freezed
          ? _value.stall
          : stall // ignore: cast_nullable_to_non_nullable
              as Stall?,
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
      quantity_unit: quantity_unit == freezed
          ? _value.quantity_unit
          : quantity_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      stocks: stocks == freezed
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>?,
    ));
  }

  @override
  $StallCopyWith<$Res>? get stall {
    if (_value.stall == null) {
      return null;
    }

    return $StallCopyWith<$Res>(_value.stall!, (value) {
      return _then(_value.copyWith(stall: value));
    });
  }
}

/// @nodoc
abstract class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) then) =
      __$ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) int? stall_id,
      @HiveField(2) Stall? stall,
      @HiveField(3) String? name,
      @HiveField(4) String? description,
      @HiveField(5) String? photo_url,
      @HiveField(6) String? quantity_unit,
      @HiveField(7) int? weight,
      @HiveField(8) int? price,
      @HiveField(9) int? stocks,
      @HiveField(10) List<ProductCategory>? categories});

  @override
  $StallCopyWith<$Res>? get stall;
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(_Product _value, $Res Function(_Product) _then)
      : super(_value, (v) => _then(v as _Product));

  @override
  _Product get _value => super._value as _Product;

  @override
  $Res call({
    Object? id = freezed,
    Object? stall_id = freezed,
    Object? stall = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? photo_url = freezed,
    Object? quantity_unit = freezed,
    Object? weight = freezed,
    Object? price = freezed,
    Object? stocks = freezed,
    Object? categories = freezed,
  }) {
    return _then(_Product(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stall_id: stall_id == freezed
          ? _value.stall_id
          : stall_id // ignore: cast_nullable_to_non_nullable
              as int?,
      stall: stall == freezed
          ? _value.stall
          : stall // ignore: cast_nullable_to_non_nullable
              as Stall?,
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
      quantity_unit: quantity_unit == freezed
          ? _value.quantity_unit
          : quantity_unit // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      stocks: stocks == freezed
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 3, adapterName: 'ProductAdapter')
class _$_Product implements _Product {
  const _$_Product(
      {@HiveField(0) this.id,
      @HiveField(1) this.stall_id,
      @HiveField(2) this.stall,
      @HiveField(3) this.name,
      @HiveField(4) this.description,
      @HiveField(5) this.photo_url,
      @HiveField(6) this.quantity_unit,
      @HiveField(7) this.weight,
      @HiveField(8) this.price,
      @HiveField(9) this.stocks,
      @HiveField(10) this.categories});

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final int? stall_id;
  @override
  @HiveField(2)
  final Stall? stall;
  @override
  @HiveField(3)
  final String? name;
  @override
  @HiveField(4)
  final String? description;
  @override
  @HiveField(5)
  final String? photo_url;
  @override
  @HiveField(6)
  final String? quantity_unit;
  @override
  @HiveField(7)
  final int? weight;
  @override
  @HiveField(8)
  final int? price;
  @override
  @HiveField(9)
  final int? stocks;
  @override
  @HiveField(10)
  final List<ProductCategory>? categories;

  @override
  String toString() {
    return 'Product(id: $id, stall_id: $stall_id, stall: $stall, name: $name, description: $description, photo_url: $photo_url, quantity_unit: $quantity_unit, weight: $weight, price: $price, stocks: $stocks, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Product &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.stall_id, stall_id) ||
                const DeepCollectionEquality()
                    .equals(other.stall_id, stall_id)) &&
            (identical(other.stall, stall) ||
                const DeepCollectionEquality().equals(other.stall, stall)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.photo_url, photo_url) ||
                const DeepCollectionEquality()
                    .equals(other.photo_url, photo_url)) &&
            (identical(other.quantity_unit, quantity_unit) ||
                const DeepCollectionEquality()
                    .equals(other.quantity_unit, quantity_unit)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.stocks, stocks) ||
                const DeepCollectionEquality().equals(other.stocks, stocks)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(stall_id) ^
      const DeepCollectionEquality().hash(stall) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(photo_url) ^
      const DeepCollectionEquality().hash(quantity_unit) ^
      const DeepCollectionEquality().hash(weight) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(stocks) ^
      const DeepCollectionEquality().hash(categories);

  @JsonKey(ignore: true)
  @override
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductToJson(this);
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@HiveField(0) int? id,
      @HiveField(1) int? stall_id,
      @HiveField(2) Stall? stall,
      @HiveField(3) String? name,
      @HiveField(4) String? description,
      @HiveField(5) String? photo_url,
      @HiveField(6) String? quantity_unit,
      @HiveField(7) int? weight,
      @HiveField(8) int? price,
      @HiveField(9) int? stocks,
      @HiveField(10) List<ProductCategory>? categories}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  int? get stall_id => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  Stall? get stall => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String? get name => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String? get description => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String? get photo_url => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  String? get quantity_unit => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  int? get weight => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  int? get price => throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  int? get stocks => throw _privateConstructorUsedError;
  @override
  @HiveField(10)
  List<ProductCategory>? get categories => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductCopyWith<_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
