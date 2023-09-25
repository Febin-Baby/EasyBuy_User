import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  List<Order> orders = [];

  Future<void> getOrder() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(authenti.currentUser?.email)
        .collection('orderdata')
        .orderBy('orderPlacedDate', descending: true)
        .get()
        .then((value) {
      orders = value.docs.map((doc) {
        // Create an Order object for each document in Firestore
        return Order(
          id: doc.id,
          orderPlacedDate: doc['orderPlacedDate'], // Replace with the actual field name
          // Initialize other properties based on your Firestore data
        );
      }).toList();
    });
    update();
    debugPrint('ORDER length${orders.length}');
  }
}

class Order {
  final String id;
  final DateTime orderPlacedDate;
  // Add other properties you need for an order

  Order({
    required this.id,
    required this.orderPlacedDate,
    // Initialize other properties here
  });
}
