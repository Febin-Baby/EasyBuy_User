import 'package:easybuy_user_app/view/screens/navbar/navbarscreen/navbar.dart';
import 'package:easybuy_user_app/view/widgets/commen_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: hieght * .85,
            child: Lottie.asset('assets/lottie/animation_lktfta3t.json'),
          ),
          CustomButton(
            txt: 'Go to DashBoard',
            onPressed: () {
              Get.offAll(const CustomNavigationBar());
            },
          ),
        ],
      ),
    );
  }
}
