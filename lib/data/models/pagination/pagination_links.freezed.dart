// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pagination_links.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginationLinks _$PaginationLinksFromJson(Map<String, dynamic> json) {
  return _PaginationLinks.fromJson(json);
}

/// @nodoc
class _$PaginationLinksTearOff {
  const _$PaginationLinksTearOff();

  _PaginationLinks call(
      {String? first, String? last, String? prev, String? next}) {
    return _PaginationLinks(
      first: first,
      last: last,
      prev: prev,
      next: next,
    );
  }

  PaginationLinks fromJson(Map<String, Object> json) {
    return PaginationLinks.fromJson(json);
  }
}

/// @nodoc
const $PaginationLinks = _$PaginationLinksTearOff();

/// @nodoc
mixin _$PaginationLinks {
  String? get first => throw _privateConstructorUsedError;
  String? get last => throw _privateConstructorUsedError;
  String? get prev => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationLinksCopyWith<PaginationLinks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationLinksCopyWith<$Res> {
  factory $PaginationLinksCopyWith(
          PaginationLinks value, $Res Function(PaginationLinks) then) =
      _$PaginationLinksCopyWithImpl<$Res>;
  $Res call({String? first, String? last, String? prev, String? next});
}

/// @nodoc
class _$PaginationLinksCopyWithImpl<$Res>
    implements $PaginationLinksCopyWith<$Res> {
  _$PaginationLinksCopyWithImpl(this._value, this._then);

  final PaginationLinks _value;
  // ignore: unused_field
  final $Res Function(PaginationLinks) _then;

  @override
  $Res call({
    Object? first = freezed,
    Object? last = freezed,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      first: first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String?,
      last: last == freezed
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: prev == freezed
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PaginationLinksCopyWith<$Res>
    implements $PaginationLinksCopyWith<$Res> {
  factory _$PaginationLinksCopyWith(
          _PaginationLinks value, $Res Function(_PaginationLinks) then) =
      __$PaginationLinksCopyWithImpl<$Res>;
  @override
  $Res call({String? first, String? last, String? prev, String? next});
}

/// @nodoc
class __$PaginationLinksCopyWithImpl<$Res>
    extends _$PaginationLinksCopyWithImpl<$Res>
    implements _$PaginationLinksCopyWith<$Res> {
  __$PaginationLinksCopyWithImpl(
      _PaginationLinks _value, $Res Function(_PaginationLinks) _then)
      : super(_value, (v) => _then(v as _PaginationLinks));

  @override
  _PaginationLinks get _value => super._value as _PaginationLinks;

  @override
  $Res call({
    Object? first = freezed,
    Object? last = freezed,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_PaginationLinks(
      first: first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String?,
      last: last == freezed
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: prev == freezed
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginationLinks implements _PaginationLinks {
  _$_PaginationLinks({this.first, this.last, this.prev, this.next});

  factory _$_PaginationLinks.fromJson(Map<String, dynamic> json) =>
      _$_$_PaginationLinksFromJson(json);

  @override
  final String? first;
  @override
  final String? last;
  @override
  final String? prev;
  @override
  final String? next;

  @override
  String toString() {
    return 'PaginationLinks(first: $first, last: $last, prev: $prev, next: $next)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaginationLinks &&
            (identical(other.first, first) ||
                const DeepCollectionEquality().equals(other.first, first)) &&
            (identical(other.last, last) ||
                const DeepCollectionEquality().equals(other.last, last)) &&
            (identical(other.prev, prev) ||
                const DeepCollectionEquality().equals(other.prev, prev)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(first) ^
      const DeepCollectionEquality().hash(last) ^
      const DeepCollectionEquality().hash(prev) ^
      const DeepCollectionEquality().hash(next);

  @JsonKey(ignore: true)
  @override
  _$PaginationLinksCopyWith<_PaginationLinks> get copyWith =>
      __$PaginationLinksCopyWithImpl<_PaginationLinks>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PaginationLinksToJson(this);
  }
}

abstract class _PaginationLinks implements PaginationLinks {
  factory _PaginationLinks(
      {String? first,
      String? last,
      String? prev,
      String? next}) = _$_PaginationLinks;

  factory _PaginationLinks.fromJson(Map<String, dynamic> json) =
      _$_PaginationLinks.fromJson;

  @override
  String? get first => throw _privateConstructorUsedError;
  @override
  String? get last => throw _privateConstructorUsedError;
  @override
  String? get prev => throw _privateConstructorUsedError;
  @override
  String? get next => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaginationLinksCopyWith<_PaginationLinks> get copyWith =>
      throw _privateConstructorUsedError;
}
