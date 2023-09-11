import 'package:easybuy_user_app/controller/cart_section/order_controlller.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/model/cart_model.dart';
import 'package:easybuy_user_app/service/cart_services.dart';
import 'package:easybuy_user_app/view/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityChange extends StatelessWidget {
  final String name;
  final String productId;
  final String price;
  final String image;
  QuantityChange(
      {super.key,
      required this.productId,
      required this.price,
      required this.name,
      required this.image});
  final OrderController orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select quantity'),
      content: GetBuilder<OrderController>(builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: kgrey,
          ),
          width: 150,
          height: 32,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                iconSize: 16,
                onPressed: () {
                  controller.quantityDecrement();
                },
                icon: const Icon(Icons.remove),
              ),
              Boldtext(text: '${controller.quantity}'),
              IconButton(
                iconSize: 16,
                onPressed: () {
                  controller.quantityIncrement();
                },
                icon: const Icon(Icons.add),
              )
            ],
          ),
        );
      }),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
        TextButton(
          child: const Text('Add'),
          onPressed: () {
            var que = orderController.quantity;
            var cost = int.tryParse(price);
            CartModel cartModel = CartModel(
              productId: productId,
              price: cost,
              quantity: orderController.quantity,
              name: name,
              imageLink: image,
              totalprice: cost! * que,
            );
            CartService().addToCart(cartItem: cartModel,productId: productId);
            customSnackbar(
              title: 'Sucess',
              msg: 'Done',
              barColor: kgrey,
            ); 
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
