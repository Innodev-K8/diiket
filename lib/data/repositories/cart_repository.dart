import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseCartRepository {
  Stream<List<OrderItem>> cartStream(int marketId);
  Future<List<OrderItem>> getItems(int marketId);
  Future<OrderItem?> getItem(int marketId, String cartId);
  void addItem(int marketId, OrderItem orderItem);
  void removeItem(int marketId, String cartId);
  void updateItem(
    int marketId,
    String cartId, {
    int? quantity,
    String? notes,
  });
}

final cartRepositoryProvider = StateProvider<CartRepository>((ref) {
  final firestore = ref.read(firestoreProvider);
  final firebase_uid = ref.watch(authProvider)?.firebase_uid;

  return CartRepository(firestore, firebase_uid ?? 'anonymous');
});

class CartRepository implements BaseCartRepository {
  final CollectionReference _ref;

  CartRepository(
    FirebaseFirestore _firestore,
    String _firebase_uid,
  ) : _ref = _firestore.userCartsRef(_firebase_uid);

  @override
  Stream<List<OrderItem>> cartStream(int marketId) => _ref.snapshots().map(
        (qs) => qs.docs.map((doc) => OrderItem.fromSnapshot(doc)).toList(),
      );

  @override
  Future<List<OrderItem>> getItems(int marketId) async {
    final snapshot = await _ref.get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.map((doc) => OrderItem.fromSnapshot(doc)).toList();
    }

    return [];
  }

  @override
  Future<OrderItem?> getItem(int marketId, String firebaseCartId) async {
    final snapshot = await _ref.doc(firebaseCartId).get();

    if (snapshot.exists) {
      return OrderItem.fromSnapshot(snapshot);
    }

    return null;
  }

  @override
  void addItem(int marketId, OrderItem orderItem) {
    _ref.add(orderItem.toJson());
  }

  @override
  void removeItem(int marketId, String firebaseCartId) {
    _ref.doc(firebaseCartId).delete();
  }

  @override
  void updateItem(
    int marketId,
    String firebaseCartId, {
    int? quantity,
    String? notes,
  }) {
    final Map<String, dynamic> data = {
      if (quantity != null) 'quantity': quantity,
      if (notes != null) 'notes': notes,
    };

    _ref.doc(firebaseCartId).update(data);
  }
}

extension FirestoreCartExtension on FirebaseFirestore {
  CollectionReference userCartsRef(String firebase_uid) =>
      collection('users').doc(firebase_uid).collection('items');
}

// extension CartsCollectionExtension on CollectionReference {
//   CollectionReference byMarket(int marketId) =>
//       doc('market-$marketId').collection('items');
// }

// class LocalCartRepository implements BaseCartRepository {
//   late Box<OrderItem> _box;

//   LocalCartRepository() {
//     _box = Hive.box('cart');
//   }

//   @override
//   Stream<List<OrderItem>> cartStream(int marketId) {
//     return _box.watch().map((event) => _box.values.toList());
//   }

//   @override
//   Future<OrderItem?> getItem(int marketId, String cartId) async {
//     return _box.get(cartId);
//   }

//   @override
//   Future<List<OrderItem>> getItems(int marketId) async {
//     return _box.values.toList();
//   }

//   @override
//   void addItem(int marketId, OrderItem orderItem) {
//     _box.put(orderItem.product_id, orderItem);
//   }

//   @override
//   void removeItem(int marketId, String cartId) {
//     _box.delete(cartId);
//   }

//   @override
//   Future<void> updateItem(int marketId, String cartId,
//       {int? quantity, String? notes}) async {
//     final old = await getItem(marketId, cartId);

//     if (old == null) return;

//     _box.put(
//       cartId,
//       old.copyWith(
//         quantity: quantity ?? old.quantity,
//         notes: notes ?? old.notes,
//       ),
//     );
//   }
// }
