// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetAppbar extends StatelessWidget implements PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(height);

  final String title;
  final double height;
  final Widget? leading;
  final Widget? actions;
  const WidgetAppbar({
    Key? key,
    required this.title,
    this.height = kToolbarHeight,
    this.leading,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontFamily: 'Lora',fontWeight: FontWeight.w800),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      leading: (leading== null)? null:  Builder(builder: (context) {  
       return leading!;
      }),
      backgroundColor: Colors.white,
      actions: (actions == null) ? null : [actions!],
    );
  }

  @override
  Widget get child => throw UnimplementedError();
}
