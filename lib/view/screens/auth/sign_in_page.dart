import 'package:easybuy_user_app/controller/authcontroller/auth_controller.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/view/screens/auth/sign_up.dart';
import 'package:easybuy_user_app/view/screens/auth/widgets/last_row_letter.dart';
import 'package:easybuy_user_app/view/widgets/commen_button.dart';
import 'package:easybuy_user_app/view/widgets/google_button.dart';
import 'package:easybuy_user_app/view/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final authcontroller = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 400) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  khiegh20,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.width * .7,
                    child: Lottie.asset(
                      'assets/lottie/animation_lkthvyt2.json',
                      fit: BoxFit.cover,
                    ),
                  ),
                  khiegh20,
                  const Text(
                    'Welcome to i Store',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  khiegh20,
                  const Boldtext(text: 'Sign in and Continue'),
                  khieg10,
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TTextFormField(
                          text: 'Enter Your Email',
                          preffix: Icons.person,
                          controller: authcontroller.loginemail,
                          inputType: TextInputType.name,
                          obscureText: false,
                        ),
                        TTextFormField(
                          text: 'Enter Your Password',
                          preffix: Icons.password_rounded,
                          controller: authcontroller.loginpassword,
                          inputType: TextInputType.name,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => CustomButton(
                      txt: authcontroller.loading.value
                          ? 'loading...!'
                          : 'Sign In',
                      onPressed: () {
                        debugPrint(authcontroller.loginemail.text);
                        debugPrint(authcontroller.loginpassword.text);
                        if (_formKey.currentState!.validate()) {
                          authcontroller.signIn();
                        }
                      },
                    ),
                  ),
                  const Text(
                    'OR',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  khieg10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GoogleButton(authcontroller: authcontroller),
                  ),
                  khiegh20,
                  InkWell(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: const Boldtext(
                      text: 'Forgott password',
                    ),
                  ),
                  LastRowLetters(
                    first: "Don't have an account? ",
                    second: 'Sign Up.',
                    function: () {
                      authcontroller.loginemail.clear();
                      authcontroller.loginpassword.clear();
                      Get.off(SignUpPae());
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          height: MediaQuery.of(context).size.width * .4,
          child: Lottie.asset(
            'assets/lottie/animation_lkthvyt2.json',
            //fit: BoxFit.cover,
          ),
        );
      }
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          height: 400, // You can adjust the height as needed
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'Forgot password!',
                  style: TextStyle(fontSize: 20),
                ),
                khiegh20,
                TextFormField(
                  autofocus: false,
                  controller: authcontroller
                      .textEditingController, // The controller to manage the input text
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText:
                        'Enter your name', // The label text for the input field
                    icon: Icon(
                      Icons.password,
                    ), // An icon to display before the input field
                  ),
                ),
                khiegh20,
                ElevatedButton(
                  onPressed: () {
                    authcontroller.resetPasswordd();
                    //authcontroller.loginemail.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 45),
                    backgroundColor: purpple, // Background color
                    foregroundColor: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Button border radius
                    ), // Button padding
                  ),
                  child: const Boldtext(text: 'Reset'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
