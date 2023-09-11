import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/functions/checkInternet.dart';
import 'package:easybuy_user_app/main.dart';
import 'package:easybuy_user_app/view/screens/splashscreen/splash_screen.dart';
import 'package:easybuy_user_app/view/widgets/commen_button.dart';
import 'package:easybuy_user_app/view/widgets/widget_loading_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreenNoInternet extends StatelessWidget {
  const ScreenNoInternet({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/fix-no-internet-connection.jpg.webp',
              scale: 2,
            ),
            khieg10,
            const Text(
              'Ooops!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: purpple,
              ),
            ),
            khieg10,
            const Boldtext(
              text:
                  'Slow or no internet connection\n Check your inernet settings.',
            ),
            khieg10,
            CustomButton(
              txt: 'Try again',
              onPressed: () async {
                checkInternet = await checkInternetConnetion();

                // ignore: use_build_context_synchronously
                await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return const WidgetLoadingAlert(
                      duration: 2000,
                    );
                  },
                );
                Get.snackbar(
                  'Ooops Something went wrong',
                  'Try again later...!',
                  snackPosition: SnackPosition.BOTTOM,
                );
                if (checkInternet) {
                  Get.offAll(SplashScreen());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
