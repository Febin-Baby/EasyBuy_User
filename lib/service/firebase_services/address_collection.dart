import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/model/address_model.dart';
import 'package:get/get.dart';

class AddressServices {
  addressAddtoFirebase({required AddressModel addressModel}) {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(authenti.currentUser?.uid)
          .collection('address')
          .doc()
          .set(addressModel.toMap(), SetOptions(merge: true))
          .then((value) {
        Get.snackbar('Added', 'done');
      });
    } catch (e) {
      Get.snackbar('Firebase exception', e.toString());
    }
  }

  
  addressDeleteFromFirebase({required String documentId})async{
    try {
      FirebaseFirestore.instance.collection('users').doc(authenti.currentUser?.uid).collection('address').doc(documentId).delete();
    } on FirebaseException catch (e) {
      Get.snackbar('Firebase exception', e.toString());
    }
  }
}
