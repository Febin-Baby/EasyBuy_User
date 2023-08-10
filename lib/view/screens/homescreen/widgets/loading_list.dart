// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LoadingList extends StatelessWidget {
  const LoadingList({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black.withOpacity(.04),
      ),
    );
  }
}
