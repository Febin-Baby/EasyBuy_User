import 'package:easybuy_user_app/controller/cart_section/cart_controller.dart';
import 'package:easybuy_user_app/controller/payment_contoller/payment_controller.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/model/address_model.dart';
import 'package:easybuy_user_app/model/order_model.dart';
import 'package:easybuy_user_app/service/order_services.dart';
import 'package:easybuy_user_app/view/screens/ckeckout_scction/widgets/razorpay.dart';
import 'package:easybuy_user_app/view/screens/profilepage/adrees_section/adrees_page.dart';
import 'package:easybuy_user_app/view/widgets/app_bar_custom.dart';
import 'package:easybuy_user_app/view/widgets/commen_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key, required this.addressModel});
  final AddressModel? addressModel;

  PaymentCotroller paymentCotroller = Get.put(PaymentCotroller());
  CartController cartController = Get.find<CartController>();
  RazorpayServices razorpayServices = RazorpayServices();

  @override
  Widget build(BuildContext context) {
    razorpayServices.successPayment();
    cartController.getCartItems();
    var displ = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const WidgetAppbar(title: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: displ * .3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                color: purpple,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AdressScreen()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: kgrey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: const EdgeInsets.all(21),
                  child: addressModel == null
                      ? const Center(
                          child: Boldtext18(text: 'Select address'),
                        )
                      : Center(
                          child: Column(
                            children: [
                              const Boldtext18(text: 'Selected address'),
                              khieg10,
                              Text('Name : ${addressModel!.name}'),
                              divider(),
                              Text('Phone : ${addressModel!.phone}'),
                              divider(),
                              Text('Housename : ${addressModel!.housename}'),
                              divider(),
                              Text('PostOffice : ${addressModel!.postoffice}'),
                              divider(),
                              Text('State : ${addressModel!.state}'),
                              divider(),
                              Text('City : ${addressModel!.city}'),
                              divider(),
                              Text('Zipcode : ${addressModel!.zipcode}'),
                              divider(),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            khiegh20,
            const Boldtext18(text: 'Your selected items'),
            khieg10,
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: kgrey, borderRadius: BorderRadius.circular(10)),
                    width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                cartController.cartList[index].imageLink!,
                              ),
                            ),
                          ),
                        ),
                        khieg10,
                        Text(
                          'Name : ${cartController.cartList[index].name!}',
                        ),
                        Boldtext(
                            text:
                                'Price : \$${cartController.cartList[index].price}.00'),
                        Text(cartController.cartList[index].quantity! > 1
                            ? 'Quantity : ${cartController.cartList[index].quantity} items'
                            : 'Quantity : ${cartController.cartList[index].quantity} item'),
                        Text(
                          'Total Price : \$${cartController.cartList[index].totalprice!}.00',
                        ),
                      ],
                    ),
                  );
                },
                itemCount: cartController.cartList.length,
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Boldtext(text: 'Total order price'),
                  kwidth20,
                  Boldtext18(text: '\$${cartController.totalcartprice}.00'),
                  kwidth10,
                ],
              ),
            ),
            // Payment options
            khieg10,
            const Boldtext18(text: 'Select payment methods'),
            Obx(
              () => Card(
                elevation: 4,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: RadioListTile(
                  title: const Text('Cash on Delivery (COD)'),
                  value: 'COD',
                  groupValue: paymentCotroller.selectedMethod.value,
                  onChanged: (value) {
                    paymentCotroller.changeMethod(touchValue: value!);
                  },
                ),
              ),
            ),
            Obx(
              () => Card(
                elevation: 4,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: RadioListTile(
                  title: const Text('Razorpay'),
                  value: 'Razorpay',
                  groupValue: paymentCotroller.selectedMethod.value,
                  onChanged: (value) {
                    paymentCotroller.changeMethod(touchValue: 'Razorpay');
                  },
                ),
              ),
            ),
            CustomButton(
              txt: 'Place order',
              onPressed: () {
                if (paymentCotroller.selectedMethod.value == 'COD') {
                  debugPrint('COD');
                  String? userId = authenti.currentUser?.uid;
                  String placedDate = DateTime.now().toString();
                  OrderModell orderModel = OrderModell(
                    cartlist: cartController.cartList,
                    paymentId: 'COD',
                    discription: '${razorpayServices.usermail}order',
                    address: addressModel,
                    israzorpay: false,
                    userid: userId,
                    totalPrice: cartController.totalcartprice,
                    orderStatus: 'order placed',
                    orderPlacedDate: placedDate,
                  );
                  OrderServicess(orderModel).addOrder();
                } else {
                  debugPrint('razorpay');
                  RazorpayServices().openCheckout(
                    totalPrice: cartController.totalcartprice,
                    cartList: cartController.cartList,
                    address: addressModel!,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Divider divider() {
    return const Divider(
      height: .2,
      color: kred,
      indent: Checkbox.width,
      endIndent: Checkbox.width,
    );
  }
}
