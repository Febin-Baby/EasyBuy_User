import 'package:easybuy_user_app/controller/cart_section/varient.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductVarientsToLast extends StatelessWidget {
  ProductVarientsToLast({super.key, required this.varients});
  final List varients;
  final VariantsController variantsController = Get.put(VariantsController());
  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titletext('Available variants'),
        selectHieght(khieght * 0.01),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: khieght * 0.045,
            crossAxisSpacing: khieght * 0.005,
            mainAxisSpacing: khieght * 0.005,
          ),
          shrinkWrap: true,
          itemCount: varients.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final variant = varients[index];
            final isSelected = variantsController.selectedVariants.contains(variant);
            return GestureDetector(
              onTap: () {
                variantsController.toggleVariant(variant);
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : kgrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(child: Text(variant)),
                ),
              ),
            );
          },
        ),
        selectHieght(khieght * 0.01),
      ],
    );
  }

  Widget _titletext(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        selectHieght(khieght * 0.01),
        Text(text),
      ],
    );
  }
}
