import 'package:easybuy_user_app/controller/authcontroller/auth_controller.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    required this.authcontroller,
  });

  final AuthController authcontroller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        backgroundColor: MaterialStateProperty.all<Color>(
          kwhite,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      onPressed: () {
        authcontroller.googleSignIn();
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesome.google,color: Colors.red,size: 17),
          kwidth20,
          Text('Continue with Google'),
        ],
      ),
    );
  }
}
