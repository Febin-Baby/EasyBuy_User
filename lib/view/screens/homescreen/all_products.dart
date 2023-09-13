import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/controller/wishlist/wishlist_controller.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/view/screens/details_page/details_page.dart';
import 'package:easybuy_user_app/view/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

//WishlistController wishListObj = WishlistController();

class CustomProductBuilder extends StatelessWidget {
  CustomProductBuilder({super.key});
  final WishlistController wishListObj = Get.put(WishlistController());
  @override
  Widget build(BuildContext context) {
    wishListObj.getwishlist();
    CollectionReference productrefereence =
        FirebaseFirestore.instance.collection('product');
    return StreamBuilder(
      stream: productrefereence.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Center(
            child: Loading(),
          );
        }

        if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('Sorry no items available'),
          );
        }

        return GridView.builder(
          itemCount: snapshot.data!.docs.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: kwidth * .02,
            mainAxisSpacing: khieght * .01,
            mainAxisExtent: khieght * .34,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  DetailsPage(
                    index: index,
                    proId: snapshot.data!.docs[index].id,
                    queryDocumentSnapshot: snapshot.data!.docs[index],
                  ),
                );
              },
              child: _itemsGrid(
                queryDocumentSnapshot: snapshot.data!.docs[index],
                name: snapshot.data!.docs[index]['name'],
                imagepath: snapshot.data!.docs[index]['imagelist'][0],
                discount: snapshot.data!.docs[index]['stringdiscount'],
                price: snapshot.data!.docs[index]['stringprice'],
              ),
            );
          },
        );
      },
    );
  }

  Container _itemsGrid({
    required QueryDocumentSnapshot<Object?> queryDocumentSnapshot,
    required String name,
    required String imagepath,
    required String discount,
    required String price,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: kgrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                width: kwidth * 0.5,
                height: khieght * 0.2,
                fit: BoxFit.cover,
                imagepath,
                errorBuilder: (context, error, stackTrace) =>
                    SizedBox(width: kwidth * 0.5, height: khieght * 0.2),
              ),
            ),
            Row(
              children: [
                Boldtext18(
                  text: name,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    if (wishListObj.wishlist
                        .contains(queryDocumentSnapshot.id)) {
                          debugPrint('from screen ${queryDocumentSnapshot.id}');
                      wishListObj.remove(productId: queryDocumentSnapshot.id);
                      debugPrint(queryDocumentSnapshot.id);
                    } else {
                      wishListObj.add(productId: queryDocumentSnapshot.id);
                    }
                  },
                  child: GetBuilder<WishlistController>(
                    init: wishListObj,
                    builder: (controller) {
                      //wishListObj = controller;
                      return Icon(
                        controller.wishlist.contains(queryDocumentSnapshot.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 28,
                        color: Colors.red,
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star),
                  const Text(
                    '4.5',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: kgrey,
                      ),
                      width: kwidth * .12,
                      height: khieght * .03,
                      child: const Center(
                        child: Text(
                          '3 Left',
                          style: TextStyle(
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
                  Text(
                    '\$$price',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  SizedBox(
                    child: Shimmer.fromColors(
                      baseColor:
                          const Color.fromARGB(255, 64, 0, 255).withOpacity(.9),
                      highlightColor: Colors.deepOrange,
                      child: Boldtext(text: '$discount% OFF'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
