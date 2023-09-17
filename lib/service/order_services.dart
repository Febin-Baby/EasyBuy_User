import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/model/order_model.dart';
import 'package:easybuy_user_app/view/screens/success_page.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class OrderServices {
  final OrderModell orderdae;
  OrderServices(this.orderdae);

  addOrde() async {
    try {
      debugPrint('Firebase add oreder function');
      String date = DateTime.now().toString();
      await FirebaseFirestore.instance
          .collection('order')
          .add(orderdae.toMap())
          .then(
        (value) async {
          FirebaseFirestore.instance
              .collection('users')
              .doc(authenti.currentUser!.email)
              .collection('order_items')
              .doc(value.id)
              .set({
            value.id: value.id,
            'orderStatus': 'orderplaced',
            'orderPlacedDate': date,
          }).then((value) => Get.to(const SuccessScreen()));
        },
      );
    } on FirebaseException catch (e) {
      Get.snackbar('Order placing error', e.message.toString());
    }
  }

  
}

class OrderServicess {
  final OrderModell _orderData;
  OrderServicess(this._orderData);
  addOrder() async {
    try {
      String date = DateTime.now().toString();
      await FirebaseFirestore.instance
          .collection('order')
          .add(_orderData.toMap())
          .then((value) async {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(authenti.currentUser!.email)
            .collection('orderdata')
            .doc(value.id)
            .set({
          value.id: value.id,
          'orderStatus': 'Order Placed',
          'orderPlacedDate': date
        }).then((value) {
          Get.to(() => const SuccessScreen());
        });
      });
    } on FirebaseException catch (e) {
      log(e.message.toString());
    }
  }
}
