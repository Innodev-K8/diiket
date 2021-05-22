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
      {int? id,
      int? stallId,
      Stall? stall,
      String? name,
      String? description,
      String? image,
      String? quantityUnit,
      int? weight,
      int? price,
      int? stocks,
      List<ProductCategory>? categories}) {
    return _Product(
      id: id,
      stallId: stallId,
      stall: stall,
      name: name,
      description: description,
      image: image,
      quantityUnit: quantityUnit,
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
  int? get id => throw _privateConstructorUsedError;
  int? get stallId => throw _privateConstructorUsedError;
  Stall? get stall => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get quantityUnit => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int? get stocks => throw _privateConstructorUsedError;
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
      {int? id,
      int? stallId,
      Stall? stall,
      String? name,
      String? description,
      String? image,
      String? quantityUnit,
      int? weight,
      int? price,
      int? stocks,
      List<ProductCategory>? categories});

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
    Object? stallId = freezed,
    Object? stall = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? quantityUnit = freezed,
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
      stallId: stallId == freezed
          ? _value.stallId
          : stallId // ignore: cast_nullable_to_non_nullable
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
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityUnit: quantityUnit == freezed
          ? _value.quantityUnit
          : quantityUnit // ignore: cast_nullable_to_non_nullable
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
      {int? id,
      int? stallId,
      Stall? stall,
      String? name,
      String? description,
      String? image,
      String? quantityUnit,
      int? weight,
      int? price,
      int? stocks,
      List<ProductCategory>? categories});

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
    Object? stallId = freezed,
    Object? stall = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? quantityUnit = freezed,
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
      stallId: stallId == freezed
          ? _value.stallId
          : stallId // ignore: cast_nullable_to_non_nullable
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
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityUnit: quantityUnit == freezed
          ? _value.quantityUnit
          : quantityUnit // ignore: cast_nullable_to_non_nullable
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
class _$_Product implements _Product {
  const _$_Product(
      {this.id,
      this.stallId,
      this.stall,
      this.name,
      this.description,
      this.image,
      this.quantityUnit,
      this.weight,
      this.price,
      this.stocks,
      this.categories});

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductFromJson(json);

  @override
  final int? id;
  @override
  final int? stallId;
  @override
  final Stall? stall;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final String? quantityUnit;
  @override
  final int? weight;
  @override
  final int? price;
  @override
  final int? stocks;
  @override
  final List<ProductCategory>? categories;

  @override
  String toString() {
    return 'Product(id: $id, stallId: $stallId, stall: $stall, name: $name, description: $description, image: $image, quantityUnit: $quantityUnit, weight: $weight, price: $price, stocks: $stocks, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Product &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.stallId, stallId) ||
                const DeepCollectionEquality()
                    .equals(other.stallId, stallId)) &&
            (identical(other.stall, stall) ||
                const DeepCollectionEquality().equals(other.stall, stall)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.quantityUnit, quantityUnit) ||
                const DeepCollectionEquality()
                    .equals(other.quantityUnit, quantityUnit)) &&
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
      const DeepCollectionEquality().hash(stallId) ^
      const DeepCollectionEquality().hash(stall) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(quantityUnit) ^
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
      {int? id,
      int? stallId,
      Stall? stall,
      String? name,
      String? description,
      String? image,
      String? quantityUnit,
      int? weight,
      int? price,
      int? stocks,
      List<ProductCategory>? categories}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  int? get stallId => throw _privateConstructorUsedError;
  @override
  Stall? get stall => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  String? get quantityUnit => throw _privateConstructorUsedError;
  @override
  int? get weight => throw _privateConstructorUsedError;
  @override
  int? get price => throw _privateConstructorUsedError;
  @override
  int? get stocks => throw _privateConstructorUsedError;
  @override
  List<ProductCategory>? get categories => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductCopyWith<_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
