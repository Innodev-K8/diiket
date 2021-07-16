// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductFeed _$ProductFeedFromJson(Map<String, dynamic> json) {
  return _ProductFeed.fromJson(json);
}

/// @nodoc
class _$ProductFeedTearOff {
  const _$ProductFeedTearOff();

  _ProductFeed call(
      {String title = 'Produk',
      String? description,
      String? image_url,
      ProductSourceType type = ProductSourceType.category,
      String query = 'all',
      bool? require_auth = false,
      int limit = 5}) {
    return _ProductFeed(
      title: title,
      description: description,
      image_url: image_url,
      type: type,
      query: query,
      require_auth: require_auth,
      limit: limit,
    );
  }

  ProductFeed fromJson(Map<String, Object> json) {
    return ProductFeed.fromJson(json);
  }
}

/// @nodoc
const $ProductFeed = _$ProductFeedTearOff();

/// @nodoc
mixin _$ProductFeed {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get image_url => throw _privateConstructorUsedError;
  ProductSourceType get type => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  bool? get require_auth => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductFeedCopyWith<ProductFeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFeedCopyWith<$Res> {
  factory $ProductFeedCopyWith(
          ProductFeed value, $Res Function(ProductFeed) then) =
      _$ProductFeedCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String? description,
      String? image_url,
      ProductSourceType type,
      String query,
      bool? require_auth,
      int limit});
}

/// @nodoc
class _$ProductFeedCopyWithImpl<$Res> implements $ProductFeedCopyWith<$Res> {
  _$ProductFeedCopyWithImpl(this._value, this._then);

  final ProductFeed _value;
  // ignore: unused_field
  final $Res Function(ProductFeed) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? image_url = freezed,
    Object? type = freezed,
    Object? query = freezed,
    Object? require_auth = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image_url: image_url == freezed
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductSourceType,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      require_auth: require_auth == freezed
          ? _value.require_auth
          : require_auth // ignore: cast_nullable_to_non_nullable
              as bool?,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ProductFeedCopyWith<$Res>
    implements $ProductFeedCopyWith<$Res> {
  factory _$ProductFeedCopyWith(
          _ProductFeed value, $Res Function(_ProductFeed) then) =
      __$ProductFeedCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String? description,
      String? image_url,
      ProductSourceType type,
      String query,
      bool? require_auth,
      int limit});
}

/// @nodoc
class __$ProductFeedCopyWithImpl<$Res> extends _$ProductFeedCopyWithImpl<$Res>
    implements _$ProductFeedCopyWith<$Res> {
  __$ProductFeedCopyWithImpl(
      _ProductFeed _value, $Res Function(_ProductFeed) _then)
      : super(_value, (v) => _then(v as _ProductFeed));

  @override
  _ProductFeed get _value => super._value as _ProductFeed;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? image_url = freezed,
    Object? type = freezed,
    Object? query = freezed,
    Object? require_auth = freezed,
    Object? limit = freezed,
  }) {
    return _then(_ProductFeed(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image_url: image_url == freezed
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductSourceType,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      require_auth: require_auth == freezed
          ? _value.require_auth
          : require_auth // ignore: cast_nullable_to_non_nullable
              as bool?,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductFeed implements _ProductFeed {
  _$_ProductFeed(
      {this.title = 'Produk',
      this.description,
      this.image_url,
      this.type = ProductSourceType.category,
      this.query = 'all',
      this.require_auth = false,
      this.limit = 5});

  factory _$_ProductFeed.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductFeedFromJson(json);

  @JsonKey(defaultValue: 'Produk')
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? image_url;
  @JsonKey(defaultValue: ProductSourceType.category)
  @override
  final ProductSourceType type;
  @JsonKey(defaultValue: 'all')
  @override
  final String query;
  @JsonKey(defaultValue: false)
  @override
  final bool? require_auth;
  @JsonKey(defaultValue: 5)
  @override
  final int limit;

  @override
  String toString() {
    return 'ProductFeed(title: $title, description: $description, image_url: $image_url, type: $type, query: $query, require_auth: $require_auth, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductFeed &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.image_url, image_url) ||
                const DeepCollectionEquality()
                    .equals(other.image_url, image_url)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)) &&
            (identical(other.require_auth, require_auth) ||
                const DeepCollectionEquality()
                    .equals(other.require_auth, require_auth)) &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(image_url) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(query) ^
      const DeepCollectionEquality().hash(require_auth) ^
      const DeepCollectionEquality().hash(limit);

  @JsonKey(ignore: true)
  @override
  _$ProductFeedCopyWith<_ProductFeed> get copyWith =>
      __$ProductFeedCopyWithImpl<_ProductFeed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductFeedToJson(this);
  }
}

abstract class _ProductFeed implements ProductFeed {
  factory _ProductFeed(
      {String title,
      String? description,
      String? image_url,
      ProductSourceType type,
      String query,
      bool? require_auth,
      int limit}) = _$_ProductFeed;

  factory _ProductFeed.fromJson(Map<String, dynamic> json) =
      _$_ProductFeed.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get image_url => throw _privateConstructorUsedError;
  @override
  ProductSourceType get type => throw _privateConstructorUsedError;
  @override
  String get query => throw _privateConstructorUsedError;
  @override
  bool? get require_auth => throw _privateConstructorUsedError;
  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductFeedCopyWith<_ProductFeed> get copyWith =>
      throw _privateConstructorUsedError;
}
