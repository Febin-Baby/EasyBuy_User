import 'package:easybuy_user_app/controller/wishlist/wishlist_controller.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/view/screens/wishllistpage/widget/wishlist_tile.dart';
import 'package:easybuy_user_app/view/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});

  final WishlistController wishListObj = Get.find();

  @override
  Widget build(BuildContext context) {
    debugPrint('From screen ${wishListObj.wishlist.length}');
    var displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const WidgetAppbar(title: 'Your Wishlist'),
      body: SingleChildScrollView(
        child: GetBuilder<WishlistController>(
          init: wishListObj,
          builder: (controller) => controller.wishlist.isEmpty
              ? Center(
                  child: Lottie.asset(embtyLottie),
                )
              : SizedBox(
                  height: displayHeight,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return WishlistTile(
                        productId: controller.wishlist[index],
                      );
                    },
                    itemCount: controller.wishlist.length,
                  ),
                ),
        ),
      ),
    );
  }
}
