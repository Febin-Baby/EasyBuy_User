import 'package:easybuy_user_app/view/screens/auth/sign_in_page.dart';
import 'package:easybuy_user_app/view/screens/navbar/navbarscreen/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Future<void> checkUserSignIn() async {
      await Future.delayed(const Duration(milliseconds: 3700));
      if (auth.currentUser?.uid != null) {
        Get.off(const CustomNavigationBar());
      } else {
        Get.off(SignInPage());
      }
    }
    checkUserSignIn();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/splashscren.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            child: Lottie.asset(
              'assets/lottie/apple logo animation.json',
            ),
          ),
        ],
      ),
    );
  }
}
