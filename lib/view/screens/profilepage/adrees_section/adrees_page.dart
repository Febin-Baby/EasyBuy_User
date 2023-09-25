import 'package:easybuy_user_app/controller/address_controller/address_controller.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/model/address_model.dart';
import 'package:easybuy_user_app/view/screens/ckeckout_scction/checkout_screen.dart';
import 'package:easybuy_user_app/view/screens/profilepage/adrees_section/create_addess.dart';
import 'package:easybuy_user_app/view/widgets/app_bar_custom.dart';
import 'package:easybuy_user_app/view/widgets/commen_button.dart';
import 'package:easybuy_user_app/view/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AdressScreen extends StatelessWidget {
  AdressScreen({super.key});

  final AddressController addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    addressController.getaddress();
    var displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const WidgetAppbar(title: 'Select address'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: displayHeight * .78,
              child: GetBuilder<AddressController>(
                builder: (controller) {
                  if (controller.address == null) {
                    return const Center(
                      child: Loading(),
                    );
                  }
                  if (controller.address!.isEmpty) {
                    return const Center(
                      child: Text('Add address here'),
                    );
                  }

                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.address?.length,
                    itemBuilder: (context, index) {
                      return GetBuilder<AddressController>(
                        builder: (controller) {
                          return Card(
                          child: ListTile(
                            selected: true,
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Boldtext18(
                                    text:
                                        'Name :      ${controller.address![index].name}'),
                                Text(
                                    'Phone :       ${controller.address![index].phone}'),
                                Text(
                                    'House name : ${controller.address![index].housename}'),
                                Text(
                                    'Post office :   ${controller.address![index].postoffice}'),
                                Text(
                                    'State    :     ${controller.address![index].state}'),
                                Text(
                                    'City    :     ${controller.address![index].city}'),
                                Text(
                                    'Zip code  :    ${controller.address![index].zipcode}'),
                              ],
                            ),
                            leading: Radio<int>(
                              value: index,
                              groupValue: controller.selectedAddressIndex,
                              onChanged: (value) async {
                                controller.selectAddress(index: value!);
                                // Get the selected address model
                                AddressModel selectedAddress =
                                    controller.address![value];
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => CheckoutScreen(
                                      addressModel: selectedAddress,
                                    ),
                                  ),
                                );
                              },
                            ),
                            trailing: const Icon(Icons.delete),
                          ),
                        );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            const Spacer(),
            CustomButton(
              txt: 'Create new Address',
              onPressed: () {
                Get.to(CreateAddress());
              },
            ),
          ],
        ),
      ),
    );
  }
}
