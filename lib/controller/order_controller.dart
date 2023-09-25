import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  List<String> orders = [];

  Future<void> getOrder() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(authenti.currentUser?.email)
        .collection('orderdata')
        .orderBy("orderPlacedDate", descending: true)
        .get()
        .then((value) async {
      orders = value.docs.map((doc) => doc.id).toList();
    });
    update();
    debugPrint('ORDER length ${orders.length}');
  }
}
