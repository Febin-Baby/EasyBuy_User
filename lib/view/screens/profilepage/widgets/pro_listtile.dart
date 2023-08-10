import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.preffixIcon,
    required this.suffixIcon,
    required this.text,
  });
  final IconData preffixIcon;
  final String text;
  final IconData suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Card(
        child: ListTile(
          dense: true,
          leading: Icon(preffixIcon, color: purplelite, size: 16),
          title: Boldtext(text: text),
          trailing: Icon(suffixIcon, color: purplelite, size: 16),
        ),
      ),
    );
  }
}
