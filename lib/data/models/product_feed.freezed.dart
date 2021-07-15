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

  _ProductFeed call({String? label, String? query, bool? require_auth}) {
    return _ProductFeed(
      label: label,
      query: query,
      require_auth: require_auth,
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
  String? get label => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;
  bool? get require_auth => throw _privateConstructorUsedError;

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
  $Res call({String? label, String? query, bool? require_auth});
}

/// @nodoc
class _$ProductFeedCopyWithImpl<$Res> implements $ProductFeedCopyWith<$Res> {
  _$ProductFeedCopyWithImpl(this._value, this._then);

  final ProductFeed _value;
  // ignore: unused_field
  final $Res Function(ProductFeed) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? query = freezed,
    Object? require_auth = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      require_auth: require_auth == freezed
          ? _value.require_auth
          : require_auth // ignore: cast_nullable_to_non_nullable
              as bool?,
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
  $Res call({String? label, String? query, bool? require_auth});
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
    Object? label = freezed,
    Object? query = freezed,
    Object? require_auth = freezed,
  }) {
    return _then(_ProductFeed(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      require_auth: require_auth == freezed
          ? _value.require_auth
          : require_auth // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductFeed implements _ProductFeed {
  _$_ProductFeed({this.label, this.query, this.require_auth});

  factory _$_ProductFeed.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductFeedFromJson(json);

  @override
  final String? label;
  @override
  final String? query;
  @override
  final bool? require_auth;

  @override
  String toString() {
    return 'ProductFeed(label: $label, query: $query, require_auth: $require_auth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductFeed &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)) &&
            (identical(other.require_auth, require_auth) ||
                const DeepCollectionEquality()
                    .equals(other.require_auth, require_auth)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(query) ^
      const DeepCollectionEquality().hash(require_auth);

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
  factory _ProductFeed({String? label, String? query, bool? require_auth}) =
      _$_ProductFeed;

  factory _ProductFeed.fromJson(Map<String, dynamic> json) =
      _$_ProductFeed.fromJson;

  @override
  String? get label => throw _privateConstructorUsedError;
  @override
  String? get query => throw _privateConstructorUsedError;
  @override
  bool? get require_auth => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductFeedCopyWith<_ProductFeed> get copyWith =>
      throw _privateConstructorUsedError;
}
