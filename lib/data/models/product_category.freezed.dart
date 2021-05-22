// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductCategory _$ProductCategoryFromJson(Map<String, dynamic> json) {
  return _ProductCategory.fromJson(json);
}

/// @nodoc
class _$ProductCategoryTearOff {
  const _$ProductCategoryTearOff();

  _ProductCategory call({int? id, String? name}) {
    return _ProductCategory(
      id: id,
      name: name,
    );
  }

  ProductCategory fromJson(Map<String, Object> json) {
    return ProductCategory.fromJson(json);
  }
}

/// @nodoc
const $ProductCategory = _$ProductCategoryTearOff();

/// @nodoc
mixin _$ProductCategory {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCategoryCopyWith<ProductCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCategoryCopyWith<$Res> {
  factory $ProductCategoryCopyWith(
          ProductCategory value, $Res Function(ProductCategory) then) =
      _$ProductCategoryCopyWithImpl<$Res>;
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ProductCategoryCopyWithImpl<$Res>
    implements $ProductCategoryCopyWith<$Res> {
  _$ProductCategoryCopyWithImpl(this._value, this._then);

  final ProductCategory _value;
  // ignore: unused_field
  final $Res Function(ProductCategory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$ProductCategoryCopyWith<$Res>
    implements $ProductCategoryCopyWith<$Res> {
  factory _$ProductCategoryCopyWith(
          _ProductCategory value, $Res Function(_ProductCategory) then) =
      __$ProductCategoryCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name});
}

/// @nodoc
class __$ProductCategoryCopyWithImpl<$Res>
    extends _$ProductCategoryCopyWithImpl<$Res>
    implements _$ProductCategoryCopyWith<$Res> {
  __$ProductCategoryCopyWithImpl(
      _ProductCategory _value, $Res Function(_ProductCategory) _then)
      : super(_value, (v) => _then(v as _ProductCategory));

  @override
  _ProductCategory get _value => super._value as _ProductCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_ProductCategory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductCategory implements _ProductCategory {
  const _$_ProductCategory({this.id, this.name});

  factory _$_ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductCategoryFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'ProductCategory(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductCategory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$ProductCategoryCopyWith<_ProductCategory> get copyWith =>
      __$ProductCategoryCopyWithImpl<_ProductCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductCategoryToJson(this);
  }
}

abstract class _ProductCategory implements ProductCategory {
  const factory _ProductCategory({int? id, String? name}) = _$_ProductCategory;

  factory _ProductCategory.fromJson(Map<String, dynamic> json) =
      _$_ProductCategory.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductCategoryCopyWith<_ProductCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
