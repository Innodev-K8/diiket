// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_search_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductSearchHistory _$ProductSearchHistoryFromJson(Map<String, dynamic> json) {
  return _ProductSearchHistory.fromJson(json);
}

/// @nodoc
class _$ProductSearchHistoryTearOff {
  const _$ProductSearchHistoryTearOff();

  _ProductSearchHistory call(
      {@HiveField(0) int? id, @HiveField(1) String? query}) {
    return _ProductSearchHistory(
      id: id,
      query: query,
    );
  }

  ProductSearchHistory fromJson(Map<String, Object> json) {
    return ProductSearchHistory.fromJson(json);
  }
}

/// @nodoc
const $ProductSearchHistory = _$ProductSearchHistoryTearOff();

/// @nodoc
mixin _$ProductSearchHistory {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get query => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductSearchHistoryCopyWith<ProductSearchHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSearchHistoryCopyWith<$Res> {
  factory $ProductSearchHistoryCopyWith(ProductSearchHistory value,
          $Res Function(ProductSearchHistory) then) =
      _$ProductSearchHistoryCopyWithImpl<$Res>;
  $Res call({@HiveField(0) int? id, @HiveField(1) String? query});
}

/// @nodoc
class _$ProductSearchHistoryCopyWithImpl<$Res>
    implements $ProductSearchHistoryCopyWith<$Res> {
  _$ProductSearchHistoryCopyWithImpl(this._value, this._then);

  final ProductSearchHistory _value;
  // ignore: unused_field
  final $Res Function(ProductSearchHistory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? query = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ProductSearchHistoryCopyWith<$Res>
    implements $ProductSearchHistoryCopyWith<$Res> {
  factory _$ProductSearchHistoryCopyWith(_ProductSearchHistory value,
          $Res Function(_ProductSearchHistory) then) =
      __$ProductSearchHistoryCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) int? id, @HiveField(1) String? query});
}

/// @nodoc
class __$ProductSearchHistoryCopyWithImpl<$Res>
    extends _$ProductSearchHistoryCopyWithImpl<$Res>
    implements _$ProductSearchHistoryCopyWith<$Res> {
  __$ProductSearchHistoryCopyWithImpl(
      _ProductSearchHistory _value, $Res Function(_ProductSearchHistory) _then)
      : super(_value, (v) => _then(v as _ProductSearchHistory));

  @override
  _ProductSearchHistory get _value => super._value as _ProductSearchHistory;

  @override
  $Res call({
    Object? id = freezed,
    Object? query = freezed,
  }) {
    return _then(_ProductSearchHistory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'ProductSearchHistoryAdapter')
class _$_ProductSearchHistory implements _ProductSearchHistory {
  _$_ProductSearchHistory({@HiveField(0) this.id, @HiveField(1) this.query});

  factory _$_ProductSearchHistory.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductSearchHistoryFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final String? query;

  @override
  String toString() {
    return 'ProductSearchHistory(id: $id, query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductSearchHistory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(query);

  @JsonKey(ignore: true)
  @override
  _$ProductSearchHistoryCopyWith<_ProductSearchHistory> get copyWith =>
      __$ProductSearchHistoryCopyWithImpl<_ProductSearchHistory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductSearchHistoryToJson(this);
  }
}

abstract class _ProductSearchHistory implements ProductSearchHistory {
  factory _ProductSearchHistory(
      {@HiveField(0) int? id,
      @HiveField(1) String? query}) = _$_ProductSearchHistory;

  factory _ProductSearchHistory.fromJson(Map<String, dynamic> json) =
      _$_ProductSearchHistory.fromJson;

  @override
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String? get query => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductSearchHistoryCopyWith<_ProductSearchHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
