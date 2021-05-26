// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pagination_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) {
  return _PaginationMeta.fromJson(json);
}

/// @nodoc
class _$PaginationMetaTearOff {
  const _$PaginationMetaTearOff();

  _PaginationMeta call(
      {int? current_page,
      int? from,
      int? last_page,
      int? per_page,
      int? to,
      int? total,
      String? path}) {
    return _PaginationMeta(
      current_page: current_page,
      from: from,
      last_page: last_page,
      per_page: per_page,
      to: to,
      total: total,
      path: path,
    );
  }

  PaginationMeta fromJson(Map<String, Object> json) {
    return PaginationMeta.fromJson(json);
  }
}

/// @nodoc
const $PaginationMeta = _$PaginationMetaTearOff();

/// @nodoc
mixin _$PaginationMeta {
  int? get current_page => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  int? get last_page => throw _privateConstructorUsedError;
  int? get per_page => throw _privateConstructorUsedError;
  int? get to => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationMetaCopyWith<PaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationMetaCopyWith<$Res> {
  factory $PaginationMetaCopyWith(
          PaginationMeta value, $Res Function(PaginationMeta) then) =
      _$PaginationMetaCopyWithImpl<$Res>;
  $Res call(
      {int? current_page,
      int? from,
      int? last_page,
      int? per_page,
      int? to,
      int? total,
      String? path});
}

/// @nodoc
class _$PaginationMetaCopyWithImpl<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  _$PaginationMetaCopyWithImpl(this._value, this._then);

  final PaginationMeta _value;
  // ignore: unused_field
  final $Res Function(PaginationMeta) _then;

  @override
  $Res call({
    Object? current_page = freezed,
    Object? from = freezed,
    Object? last_page = freezed,
    Object? per_page = freezed,
    Object? to = freezed,
    Object? total = freezed,
    Object? path = freezed,
  }) {
    return _then(_value.copyWith(
      current_page: current_page == freezed
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      last_page: last_page == freezed
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int?,
      per_page: per_page == freezed
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PaginationMetaCopyWith<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  factory _$PaginationMetaCopyWith(
          _PaginationMeta value, $Res Function(_PaginationMeta) then) =
      __$PaginationMetaCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? current_page,
      int? from,
      int? last_page,
      int? per_page,
      int? to,
      int? total,
      String? path});
}

/// @nodoc
class __$PaginationMetaCopyWithImpl<$Res>
    extends _$PaginationMetaCopyWithImpl<$Res>
    implements _$PaginationMetaCopyWith<$Res> {
  __$PaginationMetaCopyWithImpl(
      _PaginationMeta _value, $Res Function(_PaginationMeta) _then)
      : super(_value, (v) => _then(v as _PaginationMeta));

  @override
  _PaginationMeta get _value => super._value as _PaginationMeta;

  @override
  $Res call({
    Object? current_page = freezed,
    Object? from = freezed,
    Object? last_page = freezed,
    Object? per_page = freezed,
    Object? to = freezed,
    Object? total = freezed,
    Object? path = freezed,
  }) {
    return _then(_PaginationMeta(
      current_page: current_page == freezed
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      last_page: last_page == freezed
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int?,
      per_page: per_page == freezed
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginationMeta implements _PaginationMeta {
  _$_PaginationMeta(
      {this.current_page,
      this.from,
      this.last_page,
      this.per_page,
      this.to,
      this.total,
      this.path});

  factory _$_PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$_$_PaginationMetaFromJson(json);

  @override
  final int? current_page;
  @override
  final int? from;
  @override
  final int? last_page;
  @override
  final int? per_page;
  @override
  final int? to;
  @override
  final int? total;
  @override
  final String? path;

  @override
  String toString() {
    return 'PaginationMeta(current_page: $current_page, from: $from, last_page: $last_page, per_page: $per_page, to: $to, total: $total, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaginationMeta &&
            (identical(other.current_page, current_page) ||
                const DeepCollectionEquality()
                    .equals(other.current_page, current_page)) &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.last_page, last_page) ||
                const DeepCollectionEquality()
                    .equals(other.last_page, last_page)) &&
            (identical(other.per_page, per_page) ||
                const DeepCollectionEquality()
                    .equals(other.per_page, per_page)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(current_page) ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(last_page) ^
      const DeepCollectionEquality().hash(per_page) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(path);

  @JsonKey(ignore: true)
  @override
  _$PaginationMetaCopyWith<_PaginationMeta> get copyWith =>
      __$PaginationMetaCopyWithImpl<_PaginationMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PaginationMetaToJson(this);
  }
}

abstract class _PaginationMeta implements PaginationMeta {
  factory _PaginationMeta(
      {int? current_page,
      int? from,
      int? last_page,
      int? per_page,
      int? to,
      int? total,
      String? path}) = _$_PaginationMeta;

  factory _PaginationMeta.fromJson(Map<String, dynamic> json) =
      _$_PaginationMeta.fromJson;

  @override
  int? get current_page => throw _privateConstructorUsedError;
  @override
  int? get from => throw _privateConstructorUsedError;
  @override
  int? get last_page => throw _privateConstructorUsedError;
  @override
  int? get per_page => throw _privateConstructorUsedError;
  @override
  int? get to => throw _privateConstructorUsedError;
  @override
  int? get total => throw _privateConstructorUsedError;
  @override
  String? get path => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaginationMetaCopyWith<_PaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
