import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({
    super.key,
    required this.orderData,
    required this.dateTime,
    required this.razor,
  });

  final OrderModell orderData;
  final DateTime dateTime;
  final String razor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kgrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Boldtext(text: 'Quantity :'),
                Boldtext(text: '${orderData.cartlist![0].quantity}')
              ],
            ),
            khieg10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Boldtext(text: 'Order Time :'),
                Text(
                  DateFormat('yyyy-MM-dd HH:mm').format(dateTime),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            khieg10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Boldtext(text: 'Order Status :'),
                Boldtext(
                  text: '${orderData.orderStatus}',
                ),
              ],
            ),
            khieg10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Boldtext(text: 'Total price :'),
                Boldtext(
                  text: '${orderData.cartlist![0].totalprice}',
                ),
              ],
            ),
            khieg10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Boldtext(text: 'Order type :'),
                Boldtext(
                  text: razor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
