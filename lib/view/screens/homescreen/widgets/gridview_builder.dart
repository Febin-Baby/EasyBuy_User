import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/model/product_model.dart';
import 'package:easybuy_user_app/view/screens/details_page/details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProductBuilder extends StatelessWidget {
  const CustomProductBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: homePopularProducts.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 260,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(DetailsPage(
              product: homePopularProducts,
              index: index,
            ));
          },
          child: _itemsGrid(index),
        );
      },
    );
  }

  Container _itemsGrid(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              homePopularProducts[index].image,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Boldtext18(
            text: homePopularProducts[index].title,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star),
                Text(
                  homePopularProducts[index].star.toString(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: kgrey,
                    ),
                    width: 70,
                    height: 20,
                    child: Center(
                      child: Text(
                        '${homePopularProducts[index].sold} Left',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Boldtext(text: homePopularProducts[index].price.toString()),
                const Spacer(),
                const Icon(Icons.favorite_outline_rounded)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
