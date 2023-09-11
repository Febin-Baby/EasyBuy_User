import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/model/cart_model.dart';
import 'package:flutter/material.dart';

class CartService {
  addToCart({required CartModel cartItem,required String productId,}) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc('cart ${authenti.currentUser?.uid}')
          .collection('cart')
          .doc(productId)
          .set(cartItem.toMap(), SetOptions(merge: true))
          .then((value) {
        const SnackBar(content: Text('Success add'));
      });
    } on FirebaseException catch (e) {
      SnackBar(content: Text(e.message.toString()));
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
          .doc('cart ${authenti.currentUser?.uid}')
          .collection('cart')
          .doc(productId)
          .set({
        'quantity': updateQty,
        'totalPrice': price,
      }, SetOptions(merge: true));
    } on FirebaseException catch (e) {
      log(e.message.toString());
      SnackBar(content: Text(e.message.toString()));
    }
  }

  deleteCartItem({required String productId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('cart ${authenti.currentUser?.uid}')
          .collection('cart')
          .doc(productId)
          .delete();
      const SnackBar(content: Text('Success delete'));
    } on FirebaseException catch (e) {
      SnackBar(content: Text(e.message.toString()), backgroundColor: kgrey);
    }
  }
}
