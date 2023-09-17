import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchGetxController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  var text = '';
  List<QueryDocumentSnapshot<Object?>> searchList = [];
  void setSearchQuery(String query) {
    text = query;
    serachResult();
  }

  void serachResult() async {
    if (text != '') {
      searchList = await FirebaseFirestore.instance
          .collection('product')
          .get()
          .then((value) => value.docs.where(
                (element) {
                  var name = element['name'] as String;
                  if (name.toLowerCase().contains(text.toLowerCase())) {
                    return true;
                  } else {
                    return false;
                  }
                },
              ).toList());
    } else {
      searchList = [];
    }
    update();
  }

  @override
  void onClose() {
    textEditingController.clear();
    super.onClose();
  }
}
