// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'paginated_products.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginatedProducts _$PaginatedProductsFromJson(Map<String, dynamic> json) {
  return _PaginatedProducts.fromJson(json);
}

/// @nodoc
class _$PaginatedProductsTearOff {
  const _$PaginatedProductsTearOff();

  _PaginatedProducts call(
      {List<Product>? data, PaginationLinks? links, PaginationMeta? meta}) {
    return _PaginatedProducts(
      data: data,
      links: links,
      meta: meta,
    );
  }

  PaginatedProducts fromJson(Map<String, Object> json) {
    return PaginatedProducts.fromJson(json);
  }
}

/// @nodoc
const $PaginatedProducts = _$PaginatedProductsTearOff();

/// @nodoc
mixin _$PaginatedProducts {
  List<Product>? get data => throw _privateConstructorUsedError;
  PaginationLinks? get links => throw _privateConstructorUsedError;
  PaginationMeta? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedProductsCopyWith<PaginatedProducts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedProductsCopyWith<$Res> {
  factory $PaginatedProductsCopyWith(
          PaginatedProducts value, $Res Function(PaginatedProducts) then) =
      _$PaginatedProductsCopyWithImpl<$Res>;
  $Res call(
      {List<Product>? data, PaginationLinks? links, PaginationMeta? meta});

  $PaginationLinksCopyWith<$Res>? get links;
  $PaginationMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$PaginatedProductsCopyWithImpl<$Res>
    implements $PaginatedProductsCopyWith<$Res> {
  _$PaginatedProductsCopyWithImpl(this._value, this._then);

  final PaginatedProducts _value;
  // ignore: unused_field
  final $Res Function(PaginatedProducts) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? links = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      links: links == freezed
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as PaginationLinks?,
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta?,
    ));
  }

  @override
  $PaginationLinksCopyWith<$Res>? get links {
    if (_value.links == null) {
      return null;
    }

    return $PaginationLinksCopyWith<$Res>(_value.links!, (value) {
      return _then(_value.copyWith(links: value));
    });
  }

  @override
  $PaginationMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $PaginationMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value));
    });
  }
}

/// @nodoc
abstract class _$PaginatedProductsCopyWith<$Res>
    implements $PaginatedProductsCopyWith<$Res> {
  factory _$PaginatedProductsCopyWith(
          _PaginatedProducts value, $Res Function(_PaginatedProducts) then) =
      __$PaginatedProductsCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Product>? data, PaginationLinks? links, PaginationMeta? meta});

  @override
  $PaginationLinksCopyWith<$Res>? get links;
  @override
  $PaginationMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$PaginatedProductsCopyWithImpl<$Res>
    extends _$PaginatedProductsCopyWithImpl<$Res>
    implements _$PaginatedProductsCopyWith<$Res> {
  __$PaginatedProductsCopyWithImpl(
      _PaginatedProducts _value, $Res Function(_PaginatedProducts) _then)
      : super(_value, (v) => _then(v as _PaginatedProducts));

  @override
  _PaginatedProducts get _value => super._value as _PaginatedProducts;

  @override
  $Res call({
    Object? data = freezed,
    Object? links = freezed,
    Object? meta = freezed,
  }) {
    return _then(_PaginatedProducts(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      links: links == freezed
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as PaginationLinks?,
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginatedProducts implements _PaginatedProducts {
  _$_PaginatedProducts({this.data, this.links, this.meta});

  factory _$_PaginatedProducts.fromJson(Map<String, dynamic> json) =>
      _$_$_PaginatedProductsFromJson(json);

  @override
  final List<Product>? data;
  @override
  final PaginationLinks? links;
  @override
  final PaginationMeta? meta;

  @override
  String toString() {
    return 'PaginatedProducts(data: $data, links: $links, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaginatedProducts &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.links, links) ||
                const DeepCollectionEquality().equals(other.links, links)) &&
            (identical(other.meta, meta) ||
                const DeepCollectionEquality().equals(other.meta, meta)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(links) ^
      const DeepCollectionEquality().hash(meta);

  @JsonKey(ignore: true)
  @override
  _$PaginatedProductsCopyWith<_PaginatedProducts> get copyWith =>
      __$PaginatedProductsCopyWithImpl<_PaginatedProducts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PaginatedProductsToJson(this);
  }
}

abstract class _PaginatedProducts implements PaginatedProducts {
  factory _PaginatedProducts(
      {List<Product>? data,
      PaginationLinks? links,
      PaginationMeta? meta}) = _$_PaginatedProducts;

  factory _PaginatedProducts.fromJson(Map<String, dynamic> json) =
      _$_PaginatedProducts.fromJson;

  @override
  List<Product>? get data => throw _privateConstructorUsedError;
  @override
  PaginationLinks? get links => throw _privateConstructorUsedError;
  @override
  PaginationMeta? get meta => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaginatedProductsCopyWith<_PaginatedProducts> get copyWith =>
      throw _privateConstructorUsedError;
}
