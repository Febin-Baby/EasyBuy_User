import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

final currentEmail = FirebaseAuth.instance.currentUser!.email;

class WishlistService {

  Future<void> addToWishlist(String productId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('${authenti.currentUser?.uid}')
          .collection('wishlist')
          .doc(productId)
          .set({'productid': productId}).then((value) {
        Get.snackbar('SuccessFully', 'Done');
      });
    } on FirebaseException catch (e) {
      Get.snackbar('Fail from firebase', e.message.toString());
    }
  }

  Future<void> removeFromWishlist(String productId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('${authenti.currentUser?.uid}')
          .collection('wishlist')
          .doc(productId)
          .delete()
          .then((value) {                
        Get.snackbar('Removed', 'Done');
      });
    } on FirebaseException catch (e) {
      Get.snackbar('Firebase fail', e.message.toString());
    }
  }
}
