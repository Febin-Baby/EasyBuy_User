import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/model/address_model.dart';
import 'package:easybuy_user_app/model/cart_model.dart';
import 'package:easybuy_user_app/model/order_model.dart';
import 'package:easybuy_user_app/service/order_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayServices {
  // ignore: non_constant_identifier_names
  final String my_api_key = 'rzp_test_iB6csD8z6wRUYu';
  final String? usermail = authenti.currentUser?.email;
  final razorpay = Razorpay();
  OrderModell? orderModel;

  void successPayment() {
    //razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, successCallback);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, errorCallback);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWalletCallback);
  }

  Future<void>  openCheckout({
    required int totalPrice,
    required List<CartModel> cartList,
    required AddressModel address,
  }) async {
    String? userId = authenti.currentUser?.uid;
    String paymentId = userId! + usermail!;
    String description = '${usermail}order';
    Map<String, dynamic> options = {
      'key': my_api_key,
      'amount': totalPrice,
      'currency': 'INR',
      'name': 'Eazy Buy',
      'description': description,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '6238075734', 'email': 'febinbaby879@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    String orderPlacedDate = DateTime.now().toString();
    orderModel = OrderModell(
      cartlist: cartList,
      paymentId: paymentId,
      discription: description,
      address: address,
      israzorpay: true,
      userid: userId,
      totalPrice: totalPrice,
      orderStatus: 'order plced',
      orderPlacedDate: orderPlacedDate,
    );

    try {
      razorpay.open(options);
    } on FirebaseException catch (e) {
      debugPrint('Error: $e');
      Get.snackbar('Error', e.toString());
    }
  }
    //Payment is success
  void _handlePaymentSuccess(PaymentSuccessResponse response) async{
    await OrderServicess(orderModel!).addOrder();
  }

  void errorCallback(PaymentFailureResponse response) {
    Get.snackbar('Payment error${response.code} - ${response.message}', '');
    // Handle error
  }

  void externalWalletCallback(ExternalWalletResponse response) {
    Get.snackbar('External Wallet Payment: ${response.walletName}', '');
    // Handle external wallet payment
  }
}
