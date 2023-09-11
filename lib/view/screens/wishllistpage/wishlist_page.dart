import 'package:easybuy_user_app/controller/wishlist/wishlist_controller.dart';
import 'package:easybuy_user_app/view/screens/wishllistpage/widget/wishlist_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});

  final WishlistController wishListObj =Get.find();

  @override
  Widget build(BuildContext context) {
    debugPrint('From screen ${wishListObj.wishlist.length}');
    var displayHeight = MediaQuery.of(context).size.height;
    var displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<WishlistController>(

          init: wishListObj,
          builder: (controller) => Column(
            children: [
              const SizedBox(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: displayWidth * .38,
                  ),
                  const Text(
                    'Wishlist',
                    style: TextStyle(
                        color: Color(0XFF8B8B8B),
                        fontSize: 18,
                        fontFamily: 'Sniglet'),
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                      ),
                      IconButton(
                        padding: const EdgeInsets.only(bottom: 3, right: 5),
                        onPressed: () {
                          //Get.to(() => CartScreen());
                        },
                        icon: const Icon(
                          Icons.shopping_cart_checkout_rounded,
                          //color: kSecondaryColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              controller.wishlist.isEmpty
                  ? SizedBox(
                      height: displayHeight,
                      child: const Center(child: Text('Wishlist is empty')),
                    )
                  : SizedBox(
                      height: displayHeight,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return WishlistTile(
                            productId: controller.wishlist[index],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                        itemCount: controller.wishlist.length,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
