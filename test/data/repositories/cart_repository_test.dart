import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/models/stall.dart';
import 'package:diiket/data/repositories/cart_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() {
  final firestore = FakeFirebaseFirestore();
  final cartRepository = CartRepository(firestore, 'fakeuserid123');

  test('It should get empty cart ...', () async {
    final cart = await cartRepository.getItems();

    expect(cart, isEmpty);
  });

  test(
      'It should able to add item to cart and not effecting other cart market...',
      () async {
    cartRepository.addItem(
      OrderItem(
        product_id: 1,
        product: Product(
          id: 1,
          name: 'Product 1',
          price: 10,
          stall: Stall(id: 1),
        ),
        quantity: 3,
        notes: 'Ini catatan',
      ),
    );
    cartRepository.addItem(
      OrderItem(
        product_id: 2,
        quantity: 3,
      ),
    );

    final cart = await cartRepository.getItems();

    expect(cart.length, 2);
    expect(cart[0].product?.name, 'Product 1');
    expect(cart[1].product, isNull);
  });

  test('It should get cart item...', () async {
    final cart = await cartRepository.getItems();

    final item = await cartRepository.getItem(
      cart.first.firebase_cart_id!,
    );

    expect(item?.product, isA<Product>());
    expect(item?.product?.name, 'Product 1');
    expect(item?.notes, 'Ini catatan');
    expect(item?.quantity, 3);
  });

  test('It should update cart item...', () async {
    final cart = await cartRepository.getItems();

    final item = cart.first;

    expect(item.product, isA<Product>());
    expect(item.product?.name, 'Product 1');
    expect(item.notes, 'Ini catatan');
    expect(item.quantity, 3);

    cartRepository.updateItem(
      item.firebase_cart_id!,
      quantity: 2,
      notes: 'Ini catatan baru',
    );

    final item2 = await cartRepository.getItem(item.firebase_cart_id!);

    expect(item2?.product, isA<Product>());
    expect(item2?.product?.name, 'Product 1');
    expect(item2?.notes, 'Ini catatan baru');
    expect(item2?.quantity, 2);
  });

  test('It should be able to delete cart...', () async {
    var cart = await cartRepository.getItems();

    cartRepository.removeItem(
      cart.first.firebase_cart_id!,
    );

    cart = await cartRepository.getItems();

    expect(cart.length, 1);
    expect(cart.first.product, isNull);
    expect(cart.first.quantity, 3);
  });
}