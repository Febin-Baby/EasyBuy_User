import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/model/address_model.dart';
import 'package:easybuy_user_app/view/screens/profilepage/adrees_section/adrees_page.dart';
import 'package:easybuy_user_app/view/widgets/app_bar_custom.dart';
import 'package:easybuy_user_app/view/widgets/commen_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key, required this.addressModel});

  final AddressModel? addressModel;
  String selectedPaymentOption = 'COD';

  // Default selection
  @override
  Widget build(BuildContext context) {
    //late String valu;
    var displ = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const WidgetAppbar(title: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: displ * .3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                color: purpple,
              ),
              child: InkWell(
                onTap: () {
                  Get.to(AdressScreen());
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
                              khiegh20,
                              Text(addressModel!.name),
                              Text(addressModel!.phone),
                              Text(addressModel!.housename),
                              Text(addressModel!.postoffice),
                              Text(addressModel!.state),
                              Text(addressModel!.city),
                              Text(addressModel!.zipcode),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            const Boldtext(text: 'Your selected items'),
            // Payment options
            const Boldtext(text: 'Select payment methods'),
            Card(
              child: RadioListTile(
                title: const Text('Cash on Delivery (COD)'),
                value: 'COD',
                groupValue: selectedPaymentOption,
                onChanged: (value) {},
              ),
            ),
            Card(
              child: RadioListTile(
                title: const Text('Razorpay'),
                value: 'Razorpay',
                groupValue: selectedPaymentOption,
                onChanged: (value) {},
              ),
            ),

            // Continue button
            CustomButton(
              txt: 'Place order',
              onPressed: () {
                // Implement logic to proceed with the selected payment option.
                if (selectedPaymentOption == 'COD') {
                  // Handle COD payment
                } else if (selectedPaymentOption == 'Razorpay') {
                  // Handle Razorpay payment
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
