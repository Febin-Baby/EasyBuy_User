import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/model/cart_model.dart';
import 'package:easybuy_user_app/service/cart_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartModel> cartList = [];
  int totalcartprice = 0;

  Future<void> getCartItems() async {
    try {
      List querySnapshot =
          await FirebaseFirestore.instance.collection('users').doc('cart ${authenti.currentUser?.uid}').collection('cart').get().then((value) => value.docs);
      totalcartprice = 0;
      cartList.clear();
      for (var docSnapshot in querySnapshot) {
        // Convert each document to a CartModel object
        CartModel cartItem = CartModel.fromData(
            data: docSnapshot.data() as Map<String, dynamic>);
        totalcartprice += (cartItem.price! * cartItem.quantity!);
        cartList.add(cartItem);
        log(cartList.length.toString());
        debugPrint('${cartItem.price!}');
        debugPrint('${cartItem.quantity!}');
      }
      debugPrint('$totalcartprice');
      update();
      //return cartList;
    } catch (e) {
      SnackBar(content: Text(e.toString()));
      //return [];
    }
  }

  decreaseQuentity({required int index, required BuildContext context}) {
    CartModel cart = cartList[index];
    if (cart.quantity! > 1) {
      cart.quantity = cart.quantity! - 1;
      cart.totalprice = cart.totalprice! - cart.price!;
      totalcartprice = totalcartprice - cart.price!;
      update();
      CartService().updateCartItem(
        productId: cart.productId!,
        updateQty: cart.quantity!,
        price: cart.price!,
      );
    }
  }

  increaseQuantity({required int index, required BuildContext context}) {
    CartModel cart = cartList[index];
    cart.quantity = cart.quantity! + 1;
    cart.totalprice = cart.totalprice! + cart.price!;
    totalcartprice = totalcartprice + cart.price!;
    update();
    CartService().updateCartItem(
      productId: cart.productId!,
      updateQty: cart.quantity!,
      price: cart.price!,
    );
  }

  deleteCartItem({required int index}){
    CartModel cart=cartList[index];
    CartService().deleteCartItem(productId: cart.productId!);
    totalcartprice =totalcartprice-cartList[index].totalprice!;
    cartList.removeAt(index);
    update();
  }
}
