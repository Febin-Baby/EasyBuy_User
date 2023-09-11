import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController customSnackbar({
  required String title,
  required String msg,
  required Color barColor,
  var position,
}) {
  SnackPosition pos = position ?? SnackPosition.BOTTOM;
  if (Get.isSnackbarOpen) {
    Get.closeCurrentSnackbar();
  }
  return Get.snackbar(
    title,
    msg,
    snackPosition: pos,
    margin: const EdgeInsets.all(22),
    backgroundColor: barColor,
    duration: const Duration(seconds: 2),
    colorText: Colors.white,
    padding: const EdgeInsets.all(10),
  );
}
