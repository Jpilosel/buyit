import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:buyit/controllers/shop_controller.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _shopController = ShopController();

    return Scaffold(
      body: FutureBuilder(
        future: _shopController.getPromo(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, item) {
              return Text(snapshot.data.docs[item]['name']);
            },
          );
        },
      ),
    );
  }
}
