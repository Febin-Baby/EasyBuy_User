import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SlidingImagesController extends GetxController {
  var currentIndex = 0.obs;
  var pageController = PageController();

  @override
  void onInit() {
    // Start the image sliding automatically when the widget is initialized.
    startSliding();
    super.onInit();
  }

  @override
  void onClose() {
    // Don't forget to dispose of the page controller to avoid memory leaks.
    pageController.dispose();
    startSliding();
    super.onClose();
  }

  void startSliding() {
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        if (currentIndex.value == 3) {
          currentIndex.value = 0;
        } else {
          currentIndex.value++;
        }
        // Scroll the page to the next image.
        pageController.animateToPage(
          currentIndex.value,
          duration: const Duration(milliseconds: 3000),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
