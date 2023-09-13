import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/model/address_model.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {

  List<AddressModel>? address = [];
  RxInt selectedAddressIndex = RxInt(0);
  AddressModel? selectedAddress;

  getaddress() async {
    try {
      List data = await FirebaseFirestore.instance
        .collection('users')
        .doc(authenti.currentUser?.uid)
        .collection('address')
        .get()
        .then((value) => value.docs);
        address?.clear();
      for (var docSnapshot in data) {
        // Convert each document to a Address object
        AddressModel addressitem = AddressModel.fromMap(
          data: docSnapshot);
        address?.add(addressitem);
      }
      update();
    } on FirebaseException catch (e) {
      Get.snackbar('Firebase Exception', e.toString());
    }
  }

  //For address select radio
  void selectAddress({required int index}) {
    selectedAddressIndex.value = index;
    update();
  }
  
  //For address displayng
  void updateSelectedAddress(AddressModel address) {
    selectedAddress = address;
    update();
  }
}
