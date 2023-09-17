import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/service/wishlist_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
 
  List<String> wishlist = [];

  add({required String productId}) {
    
    wishlist.add(productId);
    debugPrint('From wshlist controller ${wishlist.length}');
    debugPrint('From controller adding $productId');
    WishlistService().addToWishlist(productId);
    update();
  }

  remove({
    required String productId,
  }) {
    wishlist.remove(productId);
    debugPrint('From controller removing $productId');
    WishlistService().removeFromWishlist(productId);
    update();
  }

  getwishlist() async {
    wishlist = await FirebaseFirestore.instance
        .collection('users')
        .doc('${authenti.currentUser?.email}')
        .collection('wishlist')
        .get()
        .then((value) => value.docs.map((element) => element.id).toList());
    update();
  }
}
