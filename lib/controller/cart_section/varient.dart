import 'package:get/get.dart';

class VariantsController extends GetxController {
  final selectedVariants = <String>{}.obs;

  void toggleVariant(String variant) {
    if (selectedVariants.contains(variant)) {
      selectedVariants.remove(variant);
    } else {
      selectedVariants.add(variant);
    }
  }
}
