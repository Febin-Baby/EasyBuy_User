import 'package:easybuy_user_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset(embtyLottie),),
    );
  }
}