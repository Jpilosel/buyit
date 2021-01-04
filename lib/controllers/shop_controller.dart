import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShopController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  QuerySnapshot _docs;
  DocumentSnapshot _lastdoc;
  static const _maxProductLoading = 2;
  static const String _collectionFS = "products";
  static const String _promoFieldFS = "special-offer";
  bool noMoreProd = false;

  Future<QuerySnapshot> getPromo() async {
    if (noMoreProd) {
      return null;
    }
    if (_lastdoc == null) {
      _docs = await _db
          .collection(_collectionFS)
          .where(_promoFieldFS, isEqualTo: true)
          .limit(_maxProductLoading)
          .get();
    } else {
      _docs = await _db
          .collection(_collectionFS)
          .where(_promoFieldFS, isEqualTo: true)
          .startAfterDocument(_lastdoc)
          .limit(_maxProductLoading)
          .get();
    }
    if (_docs.docs.isNotEmpty) {
      _lastdoc = _docs.docs.last;
    }
    return _docs;
  }
}
