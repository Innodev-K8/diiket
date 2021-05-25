// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
class _$OrderItemTearOff {
  const _$OrderItemTearOff();

  _OrderItem call(
      {int? id,
      int? order_id,
      int? product_id,
      String? payment_status,
      String? status,
      String? notes,
      Product? product,
      int? quantity}) {
    return _OrderItem(
      id: id,
      order_id: order_id,
      product_id: product_id,
      payment_status: payment_status,
      status: status,
      notes: notes,
      product: product,
      quantity: quantity,
    );
  }

  OrderItem fromJson(Map<String, Object> json) {
    return OrderItem.fromJson(json);
  }
}

/// @nodoc
const $OrderItem = _$OrderItemTearOff();

/// @nodoc
mixin _$OrderItem {
  int? get id => throw _privateConstructorUsedError;
  int? get order_id => throw _privateConstructorUsedError;
  int? get product_id => throw _privateConstructorUsedError;
  String? get payment_status => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  Product? get product => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      int? order_id,
      int? product_id,
      String? payment_status,
      String? status,
      String? notes,
      Product? product,
      int? quantity});

  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res> implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  final OrderItem _value;
  // ignore: unused_field
  final $Res Function(OrderItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? order_id = freezed,
    Object? product_id = freezed,
    Object? payment_status = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? product = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as int?,
      product_id: product_id == freezed
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as int?,
      payment_status: payment_status == freezed
          ? _value.payment_status
          : payment_status // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc
abstract class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(
          _OrderItem value, $Res Function(_OrderItem) then) =
      __$OrderItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      int? order_id,
      int? product_id,
      String? payment_status,
      String? status,
      String? notes,
      Product? product,
      int? quantity});

  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$OrderItemCopyWithImpl<$Res> extends _$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(_OrderItem _value, $Res Function(_OrderItem) _then)
      : super(_value, (v) => _then(v as _OrderItem));

  @override
  _OrderItem get _value => super._value as _OrderItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? order_id = freezed,
    Object? product_id = freezed,
    Object? payment_status = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? product = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_OrderItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as int?,
      product_id: product_id == freezed
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as int?,
      payment_status: payment_status == freezed
          ? _value.payment_status
          : payment_status // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderItem implements _OrderItem {
  _$_OrderItem(
      {this.id,
      this.order_id,
      this.product_id,
      this.payment_status,
      this.status,
      this.notes,
      this.product,
      this.quantity});

  factory _$_OrderItem.fromJson(Map<String, dynamic> json) =>
      _$_$_OrderItemFromJson(json);

  @override
  final int? id;
  @override
  final int? order_id;
  @override
  final int? product_id;
  @override
  final String? payment_status;
  @override
  final String? status;
  @override
  final String? notes;
  @override
  final Product? product;
  @override
  final int? quantity;

  @override
  String toString() {
    return 'OrderItem(id: $id, order_id: $order_id, product_id: $product_id, payment_status: $payment_status, status: $status, notes: $notes, product: $product, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrderItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.order_id, order_id) ||
                const DeepCollectionEquality()
                    .equals(other.order_id, order_id)) &&
            (identical(other.product_id, product_id) ||
                const DeepCollectionEquality()
                    .equals(other.product_id, product_id)) &&
            (identical(other.payment_status, payment_status) ||
                const DeepCollectionEquality()
                    .equals(other.payment_status, payment_status)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)) &&
            (identical(other.product, product) ||
                const DeepCollectionEquality()
                    .equals(other.product, product)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(order_id) ^
      const DeepCollectionEquality().hash(product_id) ^
      const DeepCollectionEquality().hash(payment_status) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(notes) ^
      const DeepCollectionEquality().hash(product) ^
      const DeepCollectionEquality().hash(quantity);

  @JsonKey(ignore: true)
  @override
  _$OrderItemCopyWith<_OrderItem> get copyWith =>
      __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrderItemToJson(this);
  }
}

abstract class _OrderItem implements OrderItem {
  factory _OrderItem(
      {int? id,
      int? order_id,
      int? product_id,
      String? payment_status,
      String? status,
      String? notes,
      Product? product,
      int? quantity}) = _$_OrderItem;

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$_OrderItem.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  int? get order_id => throw _privateConstructorUsedError;
  @override
  int? get product_id => throw _privateConstructorUsedError;
  @override
  String? get payment_status => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get notes => throw _privateConstructorUsedError;
  @override
  Product? get product => throw _privateConstructorUsedError;
  @override
  int? get quantity => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderItemCopyWith<_OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}
