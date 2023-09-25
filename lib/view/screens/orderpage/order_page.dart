import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/controller/order_controller.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/model/order_model.dart';
import 'package:easybuy_user_app/view/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
          appBar: const WidgetAppbar(title: 'My Orders'),
          body: Column(
            children: [
              khieg10,
              SizedBox(
                child: controller.orders.isEmpty
                    ? Center(child: Lottie.asset(embtyLottie))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.orders.length,
                        itemBuilder: (context, index) {
                          var streamMaker = FirebaseFirestore.instance
                              .collection('order')
                              .doc(controller.orders[index] as String?)
                              .snapshots();
                          return StreamBuilder(
                            stream: streamMaker,
                            builder: (context, snapshot) {
                              
                              if (snapshot.data == null) {
                                return const Center(
                                  child: Text('data not found'),
                                );
                              }
                              OrderModell orderData =
                                  OrderModell.fromMap(snapshot.data);
                                  DateTime dateTime = DateTime.parse(orderData.orderPlacedDate!);
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  color: kgrey,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 15,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Boldtext(
                                                text: 'Product name :'),
                                            Boldtext(
                                              text:
                                                  '${orderData.cartlist![index].name}',
                                            ),
                                          ],
                                        ),
                                        khieg10,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Boldtext(text: 'Quantity :'),
                                            Boldtext(
                                              text:
                                                  '${orderData.cartlist![index].quantity}',
                                            ),
                                          ],
                                        ),
                                        khieg10,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Boldtext(
                                                text: 'Order Time :'),
                                            Text(
                                              DateFormat('yyyy-MM-dd HH:mm')
                                                  .format(dateTime),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        khieg10,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Boldtext(
                                                text: 'Order Status :'),
                                            Boldtext(
                                              text: '${orderData.orderStatus}',
                                            ),
                                          ],
                                        ),
                                        khieg10,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Boldtext(
                                                text: 'Total price :'),
                                            Boldtext(
                                              text:
                                                  '${orderData.cartlist![index].totalprice}',
                                            ),
                                          ],
                                        ),
                                        khieg10,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Boldtext(
                                                text: 'Order type :'),
                                            Boldtext(
                                              text: '${orderData.israzorpay}',
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
        );
      },
    );
  }
}
