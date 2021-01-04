import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShopController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  QuerySnapshot _docs;
  DocumentSnapshot _lastdoc;

  StreamController<QuerySnapshot> _streamController =
      StreamController<QuerySnapshot>();

  get getProductStream => _streamController.stream;

  bool noMoreProd = false;
  static const _maxProductLoading = 2;
  static const String _collectionFS = "products";
  static const String _promoFieldFS = "special-offer";

  void getPromo() async {
    if (noMoreProd) {
      return null;
    }
    // else {
    //   noMoreProd = true;
    // }
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
      _streamController.add(_docs);
      _lastdoc = _docs.docs.last;
    }
  }
}
