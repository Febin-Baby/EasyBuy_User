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
      List querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc('${authenti.currentUser?.uid}')
          .collection('cart')
          .get()
          .then((value) => value.docs);
      totalcartprice = 0;
      cartList.clear();
      for (var docSnapshot in querySnapshot) {
        // Convert each document to a CartModel object
        CartModel cartItem =
            CartModel.fromMap(data: docSnapshot);
        totalcartprice += (cartItem.price! * cartItem.quantity!);
        cartList.add(cartItem);
      }
      update();
    }on FirebaseException catch (e) {
      Get.snackbar('Firebase exception', e.toString());
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

  deleteCartItem({required int index}) {
    CartModel cart = cartList[index];
    CartService().deleteCartItem(productId: cart.productId!);
    totalcartprice = totalcartprice - cartList[index].totalprice!;
    cartList.removeAt(index);
    update();
  }
}
