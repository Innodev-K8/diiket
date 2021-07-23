// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_provider_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProductProviderDetailTearOff {
  const _$ProductProviderDetailTearOff();

  _ProductProviderDetail call(
      {ProductSourceType source = ProductSourceType.category,
      String query = 'all',
      int limit = 5}) {
    return _ProductProviderDetail(
      source: source,
      query: query,
      limit: limit,
    );
  }
}

/// @nodoc
const $ProductProviderDetail = _$ProductProviderDetailTearOff();

/// @nodoc
mixin _$ProductProviderDetail {
  ProductSourceType get source => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductProviderDetailCopyWith<ProductProviderDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductProviderDetailCopyWith<$Res> {
  factory $ProductProviderDetailCopyWith(ProductProviderDetail value,
          $Res Function(ProductProviderDetail) then) =
      _$ProductProviderDetailCopyWithImpl<$Res>;
  $Res call({ProductSourceType source, String query, int limit});
}

/// @nodoc
class _$ProductProviderDetailCopyWithImpl<$Res>
    implements $ProductProviderDetailCopyWith<$Res> {
  _$ProductProviderDetailCopyWithImpl(this._value, this._then);

  final ProductProviderDetail _value;
  // ignore: unused_field
  final $Res Function(ProductProviderDetail) _then;

  @override
  $Res call({
    Object? source = freezed,
    Object? query = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ProductSourceType,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ProductProviderDetailCopyWith<$Res>
    implements $ProductProviderDetailCopyWith<$Res> {
  factory _$ProductProviderDetailCopyWith(_ProductProviderDetail value,
          $Res Function(_ProductProviderDetail) then) =
      __$ProductProviderDetailCopyWithImpl<$Res>;
  @override
  $Res call({ProductSourceType source, String query, int limit});
}

/// @nodoc
class __$ProductProviderDetailCopyWithImpl<$Res>
    extends _$ProductProviderDetailCopyWithImpl<$Res>
    implements _$ProductProviderDetailCopyWith<$Res> {
  __$ProductProviderDetailCopyWithImpl(_ProductProviderDetail _value,
      $Res Function(_ProductProviderDetail) _then)
      : super(_value, (v) => _then(v as _ProductProviderDetail));

  @override
  _ProductProviderDetail get _value => super._value as _ProductProviderDetail;

  @override
  $Res call({
    Object? source = freezed,
    Object? query = freezed,
    Object? limit = freezed,
  }) {
    return _then(_ProductProviderDetail(
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ProductSourceType,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ProductProviderDetail implements _ProductProviderDetail {
  _$_ProductProviderDetail(
      {this.source = ProductSourceType.category,
      this.query = 'all',
      this.limit = 5});

  @JsonKey(defaultValue: ProductSourceType.category)
  @override
  final ProductSourceType source;
  @JsonKey(defaultValue: 'all')
  @override
  final String query;
  @JsonKey(defaultValue: 5)
  @override
  final int limit;

  @override
  String toString() {
    return 'ProductProviderDetail(source: $source, query: $query, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductProviderDetail &&
            (identical(other.source, source) ||
                const DeepCollectionEquality().equals(other.source, source)) &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)) &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(source) ^
      const DeepCollectionEquality().hash(query) ^
      const DeepCollectionEquality().hash(limit);

  @JsonKey(ignore: true)
  @override
  _$ProductProviderDetailCopyWith<_ProductProviderDetail> get copyWith =>
      __$ProductProviderDetailCopyWithImpl<_ProductProviderDetail>(
          this, _$identity);
}

abstract class _ProductProviderDetail implements ProductProviderDetail {
  factory _ProductProviderDetail(
      {ProductSourceType source,
      String query,
      int limit}) = _$_ProductProviderDetail;

  @override
  ProductSourceType get source => throw _privateConstructorUsedError;
  @override
  String get query => throw _privateConstructorUsedError;
  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductProviderDetailCopyWith<_ProductProviderDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
