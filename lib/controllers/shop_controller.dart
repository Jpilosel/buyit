import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShopController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  getPromo() {
    _db.collection('products').where('special-offer', isEqualTo: true).get();
  }
}
