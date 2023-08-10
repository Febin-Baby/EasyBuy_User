import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/model/product_model.dart';
import 'package:easybuy_user_app/view/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.product, required this.index});

  List<Product> product;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height * .4;
    return Scaffold(
      appBar: const WidgetAppbar(title: 'Product details'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(product[index].image),
                        fit: BoxFit.cover),
                  ),
                  width: double.infinity,
                  height: size,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Boldtext18(text: homePopularProducts[index].title),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_rounded,
                        size: 28,
                        color: purpple,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.star),
                    kwidth10,
                    Text(homePopularProducts[index].star),
                    kwidth20,
                    kwidth20,
                    Container(
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
                  ],
                ),
                khiegh20,
                Row(
                  children: [
                    const Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: kgrey,
                        ),
                        Boldtext(text: 'Grey'),
                      ],
                    ),
                    kwidth20,
                    kwidth10,
                    const Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: kgold,
                        ),
                        Boldtext(text: 'Gold'),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: kgrey,
                      ),
                      width: 150,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove),
                          ),
                          const Boldtext(text: '0'),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.add))
                        ],
                      ),
                    ),
                  ],
                ),
                khieg10,
                const Divider(),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Boldtext(text: 'Description'),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "As of my last update in September 2021, MacBooks are widely used for various tasks, including productivity, creative work, and general computing.",
                  ),
                ),
                khieg10,
                const Divider(),
                khiegh20,
                khiegh20,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Boldtext(text: 'Total price'),
                        Boldtext18(text: homePopularProducts[index].price),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(80, 45),
                        backgroundColor: purpple, // Background color
                        foregroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // Button border radius
                        ),
                      ),
                      child: const Boldtext(text: 'Buy'),
                    ),
                    kwidth20,
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 45),
                        backgroundColor: purpple, // Background color
                        foregroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // Button border radius
                        ), // Button padding
                      ),
                      child: const Boldtext(text: 'Add to cart'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
