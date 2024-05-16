import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/model/order_model.dart';
import 'package:easybuy_user_app/view/widgets/app_bar_custom.dart';
import 'package:easybuy_user_app/view/widgets/commen_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:order_tracker_zen/order_tracker_zen.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({
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
    DateTime dateTime = DateTime.parse(orderData.orderPlacedDate!);
    String razorPay =
        orderData.israzorpay == true ? 'Razorpay' : 'Cash on delivery';
    return Scaffold(
      appBar: const WidgetAppbar(title: 'Order Details'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            addressContainer(),
            selectHieght(khieght * .04),
            const Boldtext18(text: 'Price details'),
            selectHieght(khieght * .01),
            detailsContainer(dateTime, razorPay),
            selectHieght(khieght * .04),
            const Boldtext18(text: 'Order status'),
            OrderTrackerZen(
              tracker_data: tracker(
                status: orderData.orderStatus!,
                orderdate: orderData.orderPlacedDate,
                shippedDate: orderData.shippingDate,
                outForDeliveryDate: orderData.outForDeliveryDate,
                deliveryDate: orderData.deliveryDate,
              ),
            ),
            CustomButton(
              txt: 'Cancel',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Container detailsContainer(DateTime dateTime, String razorPay) {
    return Container(
      width: double.infinity,
      height: khieght * .16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kgrey,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            selectHieght(khieght * .02),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Boldtext(text: 'Order Type:'),
                Boldtext(text: razorPay)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Boldtext(text: 'Order Id:'),
                Boldtext(text: '${orderData.discription}')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Boldtext(text: 'Order quantity:'),
                Boldtext(text: '${orderData.cartlist![0].quantity}')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Boldtext(text: 'Total Order Price:'),
                Boldtext(text: '${orderData.totalPrice}')
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container addressContainer() {
    return Container(
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
            Boldtext(
              text: 'Name    :      ${orderData.address!.name}',
            ),
            Boldtext(
              text: 'Phone   :       ${orderData.address!.phone}',
            ),
            Boldtext(
              text: 'House name :  ${orderData.address!.housename}',
            ),
            Boldtext(
              text: 'Post office :   ${orderData.address!.postoffice}',
            ),
            Boldtext(
              text: 'State    :     ${orderData.address!.state}',
            ),
            Boldtext(
              text: 'City    :     ${orderData.address!.city}',
            ),
            Boldtext(
              text: 'Zip code  :    ${orderData.address!.zipcode}',
            ),
          ],
        ),
      ),
    );
  }

  List<TrackerData> tracker({
    required String status,
    required String? orderdate,
    required String? shippedDate,
    required String? outForDeliveryDate,
    required String? deliveryDate,
  }) {
    const List<String> statusList = [
      'Order Placed',
      'Order Shipped',
      'Out For Delivery',
      'Order Delivered',
    ];

    List<String?> dates = [
      orderdate,
      shippedDate,
      outForDeliveryDate,
      deliveryDate,
    ];

    int noOfStage = 0;
    for (int i = 0; i < 4; i++) {
      if (status == statusList[i]) {
        noOfStage = i;
      }
    }
    List<TrackerData> trackerdata = [];
    for (int i = 0; i <= noOfStage; i++) {
      String date = dates[i]!.substring(0, 10);
      String datetTime = dates[i]!.substring(0, 16);
      trackerdata.add(
        TrackerData(
          title: statusList[i],
          date: date,
          tracker_details: [
            TrackerDetails(
              title: 'Your ${statusList[i]} on',
              datetime: datetTime,
            ),
          ],
        ),
      );
    }
    return trackerdata;
  }
}
