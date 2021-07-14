import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diiket/data/models/order_item.dart';

abstract class BaseCartRepository {
  Stream<List<OrderItem>> cartStream();
  Future<List<OrderItem>> getItems();
  Future<OrderItem?> getItem(String cartId);
  void addItem(OrderItem orderItem);
  void removeItem(String cartId);
  void updateItem(
    String cartId, {
    int? quantity,
    String? notes,
  });
}

class CartRepository implements BaseCartRepository {
  final CollectionReference _ref;

  CartRepository(
    FirebaseFirestore _firestore,
    String _firebase_uid,
  ) : _ref = _firestore.userCartsRef(_firebase_uid);

  @override
  Stream<List<OrderItem>> cartStream() => _ref.snapshots().map(
        (qs) => qs.docs.map((doc) => OrderItem.fromSnapshot(doc)).toList(),
      );

  @override
  Future<List<OrderItem>> getItems() async {
    final snapshot = await _ref.get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.map((doc) => OrderItem.fromSnapshot(doc)).toList();
    }

    return [];
  }

  @override
  Future<OrderItem?> getItem(String firebaseCartId) async {
    final snapshot = await _ref.doc(firebaseCartId).get();

    if (snapshot.exists) {
      return OrderItem.fromSnapshot(snapshot);
    }

    return null;
  }

  @override
  void addItem(OrderItem orderItem) {
    _ref.add(orderItem.toJson());
  }

  @override
  void removeItem(String firebaseCartId) {
    _ref.doc(firebaseCartId).delete();
  }

  @override
  void updateItem(
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
