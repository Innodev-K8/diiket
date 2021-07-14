import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diiket/data/models/order_item.dart';

extension FirestoreCartExtension on FirebaseFirestore {
  CollectionReference userCartsRef(String firebase_uid) =>
      collection('users').doc(firebase_uid).collection('carts');
}

extension CartsCollectionExtension on CollectionReference {
  CollectionReference byMarket(int marketId) =>
      doc('market-$marketId').collection('items');
}

class CartRepository {
  final CollectionReference _ref;

  CartRepository(
    FirebaseFirestore _firestore,
    String _firebase_uid,
  ) : _ref = _firestore.userCartsRef(_firebase_uid);

  Future<List<OrderItem>> getItems(int marketId) async {
    final snapshot = await _ref.byMarket(marketId).get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.map((doc) => OrderItem.fromSnapshot(doc)).toList();
    }

    return [];
  }

  Future<OrderItem?> getItem(int marketId, String firebaseCartId) async {
    final snapshot = await _ref.byMarket(marketId).doc(firebaseCartId).get();

    if (snapshot.exists) {
      return OrderItem.fromSnapshot(snapshot);
    }

    return null;
  }

  void addItem(int marketId, OrderItem orderItem) {
    _ref.byMarket(marketId).add(orderItem.toJson());
  }

  void removeItem(int marketId, String firebaseCartId) {
    _ref.byMarket(marketId).doc(firebaseCartId).delete();
  }

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

    _ref.byMarket(marketId).doc(firebaseCartId).update(data);
  }
}
