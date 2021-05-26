// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'paginated_stalls.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginatedStalls _$PaginatedStallsFromJson(Map<String, dynamic> json) {
  return _PaginatedStalls.fromJson(json);
}

/// @nodoc
class _$PaginatedStallsTearOff {
  const _$PaginatedStallsTearOff();

  _PaginatedStalls call(
      {List<Stall>? data, PaginationLinks? links, PaginationMeta? meta}) {
    return _PaginatedStalls(
      data: data,
      links: links,
      meta: meta,
    );
  }

  PaginatedStalls fromJson(Map<String, Object> json) {
    return PaginatedStalls.fromJson(json);
  }
}

/// @nodoc
const $PaginatedStalls = _$PaginatedStallsTearOff();

/// @nodoc
mixin _$PaginatedStalls {
  List<Stall>? get data => throw _privateConstructorUsedError;
  PaginationLinks? get links => throw _privateConstructorUsedError;
  PaginationMeta? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedStallsCopyWith<PaginatedStalls> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedStallsCopyWith<$Res> {
  factory $PaginatedStallsCopyWith(
          PaginatedStalls value, $Res Function(PaginatedStalls) then) =
      _$PaginatedStallsCopyWithImpl<$Res>;
  $Res call({List<Stall>? data, PaginationLinks? links, PaginationMeta? meta});

  $PaginationLinksCopyWith<$Res>? get links;
  $PaginationMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$PaginatedStallsCopyWithImpl<$Res>
    implements $PaginatedStallsCopyWith<$Res> {
  _$PaginatedStallsCopyWithImpl(this._value, this._then);

  final PaginatedStalls _value;
  // ignore: unused_field
  final $Res Function(PaginatedStalls) _then;

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
              as List<Stall>?,
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
abstract class _$PaginatedStallsCopyWith<$Res>
    implements $PaginatedStallsCopyWith<$Res> {
  factory _$PaginatedStallsCopyWith(
          _PaginatedStalls value, $Res Function(_PaginatedStalls) then) =
      __$PaginatedStallsCopyWithImpl<$Res>;
  @override
  $Res call({List<Stall>? data, PaginationLinks? links, PaginationMeta? meta});

  @override
  $PaginationLinksCopyWith<$Res>? get links;
  @override
  $PaginationMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$PaginatedStallsCopyWithImpl<$Res>
    extends _$PaginatedStallsCopyWithImpl<$Res>
    implements _$PaginatedStallsCopyWith<$Res> {
  __$PaginatedStallsCopyWithImpl(
      _PaginatedStalls _value, $Res Function(_PaginatedStalls) _then)
      : super(_value, (v) => _then(v as _PaginatedStalls));

  @override
  _PaginatedStalls get _value => super._value as _PaginatedStalls;

  @override
  $Res call({
    Object? data = freezed,
    Object? links = freezed,
    Object? meta = freezed,
  }) {
    return _then(_PaginatedStalls(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Stall>?,
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
class _$_PaginatedStalls implements _PaginatedStalls {
  _$_PaginatedStalls({this.data, this.links, this.meta});

  factory _$_PaginatedStalls.fromJson(Map<String, dynamic> json) =>
      _$_$_PaginatedStallsFromJson(json);

  @override
  final List<Stall>? data;
  @override
  final PaginationLinks? links;
  @override
  final PaginationMeta? meta;

  @override
  String toString() {
    return 'PaginatedStalls(data: $data, links: $links, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaginatedStalls &&
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
  _$PaginatedStallsCopyWith<_PaginatedStalls> get copyWith =>
      __$PaginatedStallsCopyWithImpl<_PaginatedStalls>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PaginatedStallsToJson(this);
  }
}

abstract class _PaginatedStalls implements PaginatedStalls {
  factory _PaginatedStalls(
      {List<Stall>? data,
      PaginationLinks? links,
      PaginationMeta? meta}) = _$_PaginatedStalls;

  factory _PaginatedStalls.fromJson(Map<String, dynamic> json) =
      _$_PaginatedStalls.fromJson;

  @override
  List<Stall>? get data => throw _privateConstructorUsedError;
  @override
  PaginationLinks? get links => throw _privateConstructorUsedError;
  @override
  PaginationMeta? get meta => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaginatedStallsCopyWith<_PaginatedStalls> get copyWith =>
      throw _privateConstructorUsedError;
}
