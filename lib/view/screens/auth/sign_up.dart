import 'package:easybuy_user_app/controller/authcontroller/auth_controller.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/view/screens/auth/sign_in_page.dart';
import 'package:easybuy_user_app/view/screens/auth/widgets/last_row_letter.dart';
import 'package:easybuy_user_app/view/widgets/commen_button.dart';
import 'package:easybuy_user_app/view/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpPae extends StatelessWidget {
  SignUpPae({super.key});

  final authcontroller = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              khiegh20,
              khiegh20,
              SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.width * .7,
                child: Image.asset(
                  'assets/images/Unknown.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                'Welcome to E-Bucket',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple,
                  fontWeight: FontWeight.w800,
                ),
              ),
              khieg10,
              const Text(
                'Sign Up And Continue',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TTextFormField(
                        text: 'Enter Your name',
                        preffix: Icons.person,
                        controller: authcontroller.name,
                        inputType: TextInputType.name,
                        obscureText: false,
                      ),
                      TTextFormField(
                        text: 'Enter Your email',
                        preffix: Icons.email_outlined,
                        controller: authcontroller.email,
                        inputType: TextInputType.name,
                        obscureText: false,
                      ),
                      TTextFormField(
                        text: 'Enter Your password',
                        preffix: Icons.password_sharp,
                        controller: authcontroller.password,
                        inputType: TextInputType.name,
                        obscureText: true,
                      ),
                    ],
                  )),
              Obx(
                () => CustomButton(
                  txt: authcontroller.loading.value ? 'Loading...!' : 'Sign Up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authcontroller.signuUp();
                    }
                  },
                ),
              ),
              LastRowLetters(
                first: "Already have an account? ",
                second: 'Sign In.',
                function: () {
                  authcontroller.password.clear();
                  authcontroller.name.clear();
                  authcontroller.email.clear();
                  Get.off(SignInPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
