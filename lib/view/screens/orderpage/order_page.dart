import 'package:easybuy_user_app/controller/order_controller.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/model/order_model.dart';
import 'package:easybuy_user_app/view/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetail extends StatelessWidget {
  OrderDetail({
    super.key,
    required this.orderData,
    required this.dateTime,
    required this.razor,
  });
  final OrderModell orderData;
  final DateTime dateTime;
  final String razor;
  final orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WidgetAppbar(title: 'Order Details'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: khieght * .28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kgrey,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    khieg10,
                    const Boldtext18(text: 'Billing address'),
                    khiegh20,
                    Boldtext(text: 'Name    :      ${orderData.address!.name}'),
                    Boldtext(
                        text: 'Phone   :       ${orderData.address!.phone}'),
                    Boldtext(
                        text: 'House name :  ${orderData.address!.housename}'),
                    Boldtext(
                        text:
                            'Post office :   ${orderData.address!.postoffice}'),
                    Boldtext(
                        text: 'State    :     ${orderData.address!.state}'),
                    Boldtext(text: 'City    :     ${orderData.address!.city}'),
                    Boldtext(
                        text: 'Zip code  :    ${orderData.address!.zipcode}'),
                  ],
                ),
              ),
            ),
            selectHieght(khieght * .04),
            const Boldtext18(text: 'Price details'),
            Container(
              width: double.infinity,
              height: khieght * .28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kgrey,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Boldtext(text: "Orderd item name"),
                    Boldtext(text: '${orderData.orderPlacedDate}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
