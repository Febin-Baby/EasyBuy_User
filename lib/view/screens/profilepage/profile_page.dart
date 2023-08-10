import 'package:easybuy_user_app/controller/authcontroller/auth_controller.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/view/screens/profilepage/widgets/pro_listtile.dart';
import 'package:easybuy_user_app/view/widgets/app_bar_custom.dart';
import 'package:easybuy_user_app/view/widgets/commen_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  //Controller
  final myController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WidgetAppbar(title: 'Profile'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => debugPrint('Pic select'),
                    child: const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(
                        'assets/images/ubble_edit.jpeg',
                      ),
                    ),
                  ),
                  khiegh20,
                  const Boldtext(text: 'Febin Baby'),
                  const Boldtext(text: 'febinbaby879@gmail.com'),
                  const Divider(),
                  InkWell(
                    onTap: () {},
                    child: const ProfileListTile(
                      preffixIcon: Icons.edit,
                      text: 'Edit Profile',
                      suffixIcon: Icons.arrow_circle_right_outlined,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const ProfileListTile(
                      preffixIcon: Icons.dark_mode,
                      text: 'Dark Mode',
                      suffixIcon: Icons.arrow_circle_right_outlined,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const ProfileListTile(
                      preffixIcon: Icons.home_rounded,
                      text: 'Address',
                      suffixIcon: Icons.arrow_circle_right_outlined,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const ProfileListTile(
                      preffixIcon: Icons.help_center,
                      text: 'Help center',
                      suffixIcon: Icons.arrow_circle_right_outlined,
                    ),
                  ),
                  khiegh20,
                  const Divider(),
                  khiegh20,
                  SizedBox(
                    child: CustomButton(
                      txt: 'Log out',
                      onPressed: () {
                        _showAlertDialog(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to show the AlertDialog
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log out from EasyBuy'),
          content: const Text('Are you sure?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                myController.logout();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
  
}
