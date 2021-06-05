// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
class _$OrderTearOff {
  const _$OrderTearOff();

  _Order call(
      {int? id,
      int? market_id,
      int? user_id,
      int? driver_id,
      String? status,
      String? address,
      String? location_lat,
      String? location_lng,
      int? total_weight,
      int? products_price,
      int? delivery_fee,
      int? pickup_fee,
      int? service_fee,
      int? total_price,
      List<OrderItem>? order_items}) {
    return _Order(
      id: id,
      market_id: market_id,
      user_id: user_id,
      driver_id: driver_id,
      status: status,
      address: address,
      location_lat: location_lat,
      location_lng: location_lng,
      total_weight: total_weight,
      products_price: products_price,
      delivery_fee: delivery_fee,
      pickup_fee: pickup_fee,
      service_fee: service_fee,
      total_price: total_price,
      order_items: order_items,
    );
  }

  Order fromJson(Map<String, Object> json) {
    return Order.fromJson(json);
  }
}

/// @nodoc
const $Order = _$OrderTearOff();

/// @nodoc
mixin _$Order {
  int? get id => throw _privateConstructorUsedError;
  int? get market_id => throw _privateConstructorUsedError;
  int? get user_id => throw _privateConstructorUsedError;
  int? get driver_id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get location_lat => throw _privateConstructorUsedError;
  String? get location_lng => throw _privateConstructorUsedError;
  int? get total_weight => throw _privateConstructorUsedError;
  int? get products_price => throw _privateConstructorUsedError;
  int? get delivery_fee => throw _privateConstructorUsedError;
  int? get pickup_fee => throw _privateConstructorUsedError;
  int? get service_fee => throw _privateConstructorUsedError;
  int? get total_price => throw _privateConstructorUsedError;
  List<OrderItem>? get order_items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      int? market_id,
      int? user_id,
      int? driver_id,
      String? status,
      String? address,
      String? location_lat,
      String? location_lng,
      int? total_weight,
      int? products_price,
      int? delivery_fee,
      int? pickup_fee,
      int? service_fee,
      int? total_price,
      List<OrderItem>? order_items});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res> implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  final Order _value;
  // ignore: unused_field
  final $Res Function(Order) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? market_id = freezed,
    Object? user_id = freezed,
    Object? driver_id = freezed,
    Object? status = freezed,
    Object? address = freezed,
    Object? location_lat = freezed,
    Object? location_lng = freezed,
    Object? total_weight = freezed,
    Object? products_price = freezed,
    Object? delivery_fee = freezed,
    Object? pickup_fee = freezed,
    Object? service_fee = freezed,
    Object? total_price = freezed,
    Object? order_items = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      market_id: market_id == freezed
          ? _value.market_id
          : market_id // ignore: cast_nullable_to_non_nullable
              as int?,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      driver_id: driver_id == freezed
          ? _value.driver_id
          : driver_id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location_lat: location_lat == freezed
          ? _value.location_lat
          : location_lat // ignore: cast_nullable_to_non_nullable
              as String?,
      location_lng: location_lng == freezed
          ? _value.location_lng
          : location_lng // ignore: cast_nullable_to_non_nullable
              as String?,
      total_weight: total_weight == freezed
          ? _value.total_weight
          : total_weight // ignore: cast_nullable_to_non_nullable
              as int?,
      products_price: products_price == freezed
          ? _value.products_price
          : products_price // ignore: cast_nullable_to_non_nullable
              as int?,
      delivery_fee: delivery_fee == freezed
          ? _value.delivery_fee
          : delivery_fee // ignore: cast_nullable_to_non_nullable
              as int?,
      pickup_fee: pickup_fee == freezed
          ? _value.pickup_fee
          : pickup_fee // ignore: cast_nullable_to_non_nullable
              as int?,
      service_fee: service_fee == freezed
          ? _value.service_fee
          : service_fee // ignore: cast_nullable_to_non_nullable
              as int?,
      total_price: total_price == freezed
          ? _value.total_price
          : total_price // ignore: cast_nullable_to_non_nullable
              as int?,
      order_items: order_items == freezed
          ? _value.order_items
          : order_items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>?,
    ));
  }
}

/// @nodoc
abstract class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) then) =
      __$OrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      int? market_id,
      int? user_id,
      int? driver_id,
      String? status,
      String? address,
      String? location_lat,
      String? location_lng,
      int? total_weight,
      int? products_price,
      int? delivery_fee,
      int? pickup_fee,
      int? service_fee,
      int? total_price,
      List<OrderItem>? order_items});
}

/// @nodoc
class __$OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(_Order _value, $Res Function(_Order) _then)
      : super(_value, (v) => _then(v as _Order));

  @override
  _Order get _value => super._value as _Order;

  @override
  $Res call({
    Object? id = freezed,
    Object? market_id = freezed,
    Object? user_id = freezed,
    Object? driver_id = freezed,
    Object? status = freezed,
    Object? address = freezed,
    Object? location_lat = freezed,
    Object? location_lng = freezed,
    Object? total_weight = freezed,
    Object? products_price = freezed,
    Object? delivery_fee = freezed,
    Object? pickup_fee = freezed,
    Object? service_fee = freezed,
    Object? total_price = freezed,
    Object? order_items = freezed,
  }) {
    return _then(_Order(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      market_id: market_id == freezed
          ? _value.market_id
          : market_id // ignore: cast_nullable_to_non_nullable
              as int?,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      driver_id: driver_id == freezed
          ? _value.driver_id
          : driver_id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location_lat: location_lat == freezed
          ? _value.location_lat
          : location_lat // ignore: cast_nullable_to_non_nullable
              as String?,
      location_lng: location_lng == freezed
          ? _value.location_lng
          : location_lng // ignore: cast_nullable_to_non_nullable
              as String?,
      total_weight: total_weight == freezed
          ? _value.total_weight
          : total_weight // ignore: cast_nullable_to_non_nullable
              as int?,
      products_price: products_price == freezed
          ? _value.products_price
          : products_price // ignore: cast_nullable_to_non_nullable
              as int?,
      delivery_fee: delivery_fee == freezed
          ? _value.delivery_fee
          : delivery_fee // ignore: cast_nullable_to_non_nullable
              as int?,
      pickup_fee: pickup_fee == freezed
          ? _value.pickup_fee
          : pickup_fee // ignore: cast_nullable_to_non_nullable
              as int?,
      service_fee: service_fee == freezed
          ? _value.service_fee
          : service_fee // ignore: cast_nullable_to_non_nullable
              as int?,
      total_price: total_price == freezed
          ? _value.total_price
          : total_price // ignore: cast_nullable_to_non_nullable
              as int?,
      order_items: order_items == freezed
          ? _value.order_items
          : order_items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order implements _Order {
  _$_Order(
      {this.id,
      this.market_id,
      this.user_id,
      this.driver_id,
      this.status,
      this.address,
      this.location_lat,
      this.location_lng,
      this.total_weight,
      this.products_price,
      this.delivery_fee,
      this.pickup_fee,
      this.service_fee,
      this.total_price,
      this.order_items});

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$_$_OrderFromJson(json);

  @override
  final int? id;
  @override
  final int? market_id;
  @override
  final int? user_id;
  @override
  final int? driver_id;
  @override
  final String? status;
  @override
  final String? address;
  @override
  final String? location_lat;
  @override
  final String? location_lng;
  @override
  final int? total_weight;
  @override
  final int? products_price;
  @override
  final int? delivery_fee;
  @override
  final int? pickup_fee;
  @override
  final int? service_fee;
  @override
  final int? total_price;
  @override
  final List<OrderItem>? order_items;

  @override
  String toString() {
    return 'Order(id: $id, market_id: $market_id, user_id: $user_id, driver_id: $driver_id, status: $status, address: $address, location_lat: $location_lat, location_lng: $location_lng, total_weight: $total_weight, products_price: $products_price, delivery_fee: $delivery_fee, pickup_fee: $pickup_fee, service_fee: $service_fee, total_price: $total_price, order_items: $order_items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Order &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.market_id, market_id) ||
                const DeepCollectionEquality()
                    .equals(other.market_id, market_id)) &&
            (identical(other.user_id, user_id) ||
                const DeepCollectionEquality()
                    .equals(other.user_id, user_id)) &&
            (identical(other.driver_id, driver_id) ||
                const DeepCollectionEquality()
                    .equals(other.driver_id, driver_id)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.location_lat, location_lat) ||
                const DeepCollectionEquality()
                    .equals(other.location_lat, location_lat)) &&
            (identical(other.location_lng, location_lng) ||
                const DeepCollectionEquality()
                    .equals(other.location_lng, location_lng)) &&
            (identical(other.total_weight, total_weight) ||
                const DeepCollectionEquality()
                    .equals(other.total_weight, total_weight)) &&
            (identical(other.products_price, products_price) ||
                const DeepCollectionEquality()
                    .equals(other.products_price, products_price)) &&
            (identical(other.delivery_fee, delivery_fee) ||
                const DeepCollectionEquality()
                    .equals(other.delivery_fee, delivery_fee)) &&
            (identical(other.pickup_fee, pickup_fee) ||
                const DeepCollectionEquality()
                    .equals(other.pickup_fee, pickup_fee)) &&
            (identical(other.service_fee, service_fee) ||
                const DeepCollectionEquality()
                    .equals(other.service_fee, service_fee)) &&
            (identical(other.total_price, total_price) ||
                const DeepCollectionEquality()
                    .equals(other.total_price, total_price)) &&
            (identical(other.order_items, order_items) ||
                const DeepCollectionEquality()
                    .equals(other.order_items, order_items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(market_id) ^
      const DeepCollectionEquality().hash(user_id) ^
      const DeepCollectionEquality().hash(driver_id) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(location_lat) ^
      const DeepCollectionEquality().hash(location_lng) ^
      const DeepCollectionEquality().hash(total_weight) ^
      const DeepCollectionEquality().hash(products_price) ^
      const DeepCollectionEquality().hash(delivery_fee) ^
      const DeepCollectionEquality().hash(pickup_fee) ^
      const DeepCollectionEquality().hash(service_fee) ^
      const DeepCollectionEquality().hash(total_price) ^
      const DeepCollectionEquality().hash(order_items);

  @JsonKey(ignore: true)
  @override
  _$OrderCopyWith<_Order> get copyWith =>
      __$OrderCopyWithImpl<_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrderToJson(this);
  }
}

abstract class _Order implements Order {
  factory _Order(
      {int? id,
      int? market_id,
      int? user_id,
      int? driver_id,
      String? status,
      String? address,
      String? location_lat,
      String? location_lng,
      int? total_weight,
      int? products_price,
      int? delivery_fee,
      int? pickup_fee,
      int? service_fee,
      int? total_price,
      List<OrderItem>? order_items}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  int? get market_id => throw _privateConstructorUsedError;
  @override
  int? get user_id => throw _privateConstructorUsedError;
  @override
  int? get driver_id => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  String? get location_lat => throw _privateConstructorUsedError;
  @override
  String? get location_lng => throw _privateConstructorUsedError;
  @override
  int? get total_weight => throw _privateConstructorUsedError;
  @override
  int? get products_price => throw _privateConstructorUsedError;
  @override
  int? get delivery_fee => throw _privateConstructorUsedError;
  @override
  int? get pickup_fee => throw _privateConstructorUsedError;
  @override
  int? get service_fee => throw _privateConstructorUsedError;
  @override
  int? get total_price => throw _privateConstructorUsedError;
  @override
  List<OrderItem>? get order_items => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderCopyWith<_Order> get copyWith => throw _privateConstructorUsedError;
}
