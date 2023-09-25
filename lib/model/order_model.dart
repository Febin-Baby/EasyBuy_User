import 'package:easybuy_user_app/model/address_model.dart';
import 'package:easybuy_user_app/model/cart_model.dart';

class OrderModell {
  List<CartModel>? cartlist;
  int? totalPrice;
  String? paymentId;
  String? discription;
  bool? israzorpay;
  String? orderStatus;
  String? userid;
  String? orderPlacedDate;
  String? shippingDate;
  String? outForDeliveryDate;
  String? deliveryDate;
  AddressModel? address;
  OrderModell({
    required this.cartlist,
    required this.paymentId,
    required this.discription,
    required this.address,
    required this.israzorpay,
    required this.userid,
    required this.totalPrice,
    required this.orderStatus,
    required this.orderPlacedDate,
  }) {
    orderStatusSetter();
  }

  orderStatusSetter() {
    shippingDate ??= 'Not setted';
    outForDeliveryDate ??= 'Not setted';
    deliveryDate ??= 'Not setted';
  }

  OrderModell.fromMap(var data) {
    totalPrice = data['totalPrice'];
    paymentId = data['orderId'];
    discription = data['discription'];
    israzorpay = data['isRazorpay'];
    orderStatus = data['orderStatus'];
    userid = data['userId'];
    orderPlacedDate = data['orderPlacedDate'];
    shippingDate = data['shippingDate'];
    outForDeliveryDate = data['outForDeliveryDate'];
    deliveryDate = data['deliveryDate'];

    Map cartData = data['items'] as Map;
    cartlist = [];
    for (var items in cartData.values) {
      cartlist!.add(CartModel.fromMap(data: items));
    }
    Map addressMap = data['address'] as Map;
    address = AddressModel.fromMap(data: addressMap);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> cartData = {};
    for (int i = 0; i < cartlist!.length; i++) {
      cartData['order$i'] = cartlist![i].toMap();
    }
    Map addressMap = address!.toMap();
    return {
      'items': cartData,
      'totalPrice': totalPrice,
      'orderId': paymentId,
      'discription': discription,
      'isRazorpay': israzorpay,
      'orderStatus': orderStatus,
      'address': addressMap,
      'userId': userid,
      'orderPlacedDate': orderPlacedDate,
      'shippingDate': shippingDate,
      'outForDeliveryDate': outForDeliveryDate,
      'deliveryDate': deliveryDate,
    };
  }
}

