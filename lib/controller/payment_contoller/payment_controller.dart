import 'package:get/get.dart';

class PaymentCotroller extends GetxController{
  var selectedMethod='COD'.obs;

  void changeMethod({required String touchValue}){
    selectedMethod.value=touchValue;
    update();
  }
}