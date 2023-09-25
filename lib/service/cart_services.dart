import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/model/cart_model.dart';
import 'package:get/get.dart';

class CartService {
  addToCart({required CartModel cartItem, required String productId}) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc('${authenti.currentUser?.email}')
          .collection('cart')
          .doc(productId)
          .set(cartItem.toMap(), SetOptions(merge: true))
          .then((value) {});
    } on FirebaseException catch (e) {
      Get.snackbar('Add error', '$e');
    }
  }

  updateCartItem({
    required String productId,
    required int updateQty,
    required int price,
  }) {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc('${authenti.currentUser?.email}')
          .collection('cart')
          .doc(productId)
          .set({
        'quantity': updateQty,
        'totalPrice': price,
      }, SetOptions(merge: true));
    } on FirebaseException catch (e) {
      log(e.message.toString());
      Get.snackbar('Update error', '$e');
    }
  }

  deleteCartItem({required String productId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('${authenti.currentUser?.email}')
          .collection('cart')
          .doc(productId)
          .delete();
    } on FirebaseException catch (e) {
      Get.snackbar('Delete error', '$e');
    }
  }
}

// class Cart {
//   int? quentity;
//   int? price;
//   Cart({this.price, this.quentity});

//   Cart.frommap(var data) {
//     quentity = data['quentity'];
//     price = data['price'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'quentity':quentity,
//       'price':price,
//     };
//   }
// }
