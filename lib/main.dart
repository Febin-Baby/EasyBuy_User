import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/functions/checkInternet.dart';
import 'package:easybuy_user_app/view/screens/splashscreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

bool checkInternet = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  checkInternet = await checkInternetConnetion();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    khieght = MediaQuery.of(context).size.height;
    kwidth = MediaQuery.of(context).size.width;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Urbanist',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
        ),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      // home: ShowCaseWidget(
      //   builder: Builder(
      //     builder: (context) => SplashScreen(),
      //   ),
      // ),
    );
  }
}
