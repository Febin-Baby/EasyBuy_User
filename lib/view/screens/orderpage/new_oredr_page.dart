import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/controller/order_controller.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/model/order_model.dart';
import 'package:easybuy_user_app/view/screens/orderpage/order_page.dart';
import 'package:easybuy_user_app/view/screens/orderpage/widgets/order-contaner.dart';
import 'package:easybuy_user_app/view/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  final orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    orderController.getOrder();
    return GetBuilder<OrderController>(
      init: orderController,
      builder: (controller) {
        return Scaffold(
          appBar: const WidgetAppbar(title: 'Orders'),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: controller.orders.isEmpty
                      ? Center(child: Lottie.asset(embtyLottie))
                      : ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 15),
                          itemCount: controller.orders.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var streamMaker = FirebaseFirestore.instance
                                .collection('order')
                                .doc(controller.orders[index])
                                .snapshots();
                            return StreamBuilder(
                              stream: streamMaker,
                              builder: (context, snapshot) {
                                if (snapshot.data == null) {
                                  return const Center(
                                    child: Text('Data not found'),
                                  );
                                }
                                OrderModell orderData =
                                    OrderModell.fromMap(snapshot.data);
                                String razor = orderData.israzorpay == true
                                    ? 'RazorPay'
                                    : 'Cash on delivery';
                                DateTime dateTime =
                                    DateTime.parse(orderData.orderPlacedDate!);
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(OrderDetail(orderData: orderData, dateTime: dateTime, razor: razor));
                                    },
                                    child: OrderContainer(
                                      orderData: orderData,
                                      dateTime: dateTime,
                                      razor: razor,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
