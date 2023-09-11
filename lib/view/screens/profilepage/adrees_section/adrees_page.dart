import 'package:easybuy_user_app/view/screens/profilepage/adrees_section/create_addess.dart';
import 'package:easybuy_user_app/view/widgets/app_bar_custom.dart';
import 'package:easybuy_user_app/view/widgets/commen_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AdressScreen extends StatelessWidget {
  const AdressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WidgetAppbar(title: 'Select address'),
      body: Column(
        children: [
          const Spacer(),
          CustomButton(
            txt: 'Create new Address',
            onPressed: () {
              Get.to(CreateAddress());
            },
          ),
        ],
      ),
    );
  }
}
