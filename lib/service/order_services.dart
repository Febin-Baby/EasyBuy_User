import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/model/order_model.dart';
import 'package:easybuy_user_app/view/screens/success_page.dart';
import 'package:get/get.dart';

class OrderServicess {
  final OrderModell _orderData;
  OrderServicess(this._orderData);
  Future<void> addOrder() async {
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
          'orderStatus': 'Order placed',
          'orderPlacedDate': date
        }).then((value) {
          Get.offAll(() => const SuccessScreen());
        });
      });
    } on FirebaseException catch (e) {
      log(e.message.toString());
    }
  }
}
