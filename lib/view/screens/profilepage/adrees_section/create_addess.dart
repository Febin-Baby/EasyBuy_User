import 'package:easybuy_user_app/model/address_model.dart';
import 'package:easybuy_user_app/service/address_collection.dart';
import 'package:easybuy_user_app/view/widgets/app_bar_custom.dart';
import 'package:easybuy_user_app/view/widgets/commen_button.dart';
import 'package:easybuy_user_app/view/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CreateAddress extends StatelessWidget {
  CreateAddress({super.key});

  TextEditingController nameCOntroller = TextEditingController();
  TextEditingController phoneCOntroller = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController housenameCOntroller = TextEditingController();
  TextEditingController stateCOntroller = TextEditingController();
  TextEditingController cityCOntroller = TextEditingController();
  TextEditingController postofficeCOntroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WidgetAppbar(title: 'Create address'),
      body: ListView(
        children: [
          Form(
            key: _formkey,
            child: Column(
              children: [
                TTextFormField(
                  text: 'Enter your name',
                  preffix: Icons.person,
                  controller: nameCOntroller,
                  inputType: TextInputType.name,
                  obscureText: false,
                ),
                TTextFormField(
                  maxlegth: 10,
                  text: 'Enter your phone number',
                  preffix: Icons.phone,
                  controller: phoneCOntroller,
                  inputType: TextInputType.number,
                  obscureText: false,
                ),
                TTextFormField(
                  text: 'Enter your Zipcode',
                  preffix: Icons.code,
                  controller: pinController,
                  inputType: TextInputType.number,
                  obscureText: false,
                ),
                TTextFormField(
                  text: 'Enter your house name',
                  preffix: Icons.home,
                  controller: housenameCOntroller,
                  inputType: TextInputType.name,
                  obscureText: false,
                ),
                TTextFormField(
                  text: 'Enter your postoffice',
                  preffix: Icons.local_post_office,
                  controller: postofficeCOntroller,
                  inputType: TextInputType.name,
                  obscureText: false,
                ),
                TTextFormField(
                  text: 'Enter your state',
                  preffix: Icons.straighten,
                  controller: stateCOntroller,
                  inputType: TextInputType.name,
                  obscureText: false,
                ),
                TTextFormField(
                  text: 'Enter your city',
                  preffix: Icons.location_city,
                  controller: cityCOntroller,
                  inputType: TextInputType.name,
                  obscureText: false,
                ),
              ],
            ),
          ),
          CustomButton(
            txt: 'Save Addess',
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                AddressModel addressModel = AddressModel(
                  name: nameCOntroller.text.trim(),
                  phone: phoneCOntroller.text.trim(),
                  zipcode: pinController.text.trim(),
                  housename: housenameCOntroller.text.trim(),
                  city: cityCOntroller.text.trim(),
                  state: stateCOntroller.text.trim(),
                  postoffice: postofficeCOntroller.text.trim(),
                );
                AddressServices().addressAddtoFirebase(addressModel: addressModel);
                Get.back();
              }
            },
          )
        ],
      ),
    );
  }
}
