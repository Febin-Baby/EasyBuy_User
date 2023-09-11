import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/controller/wishlist/wishlist_controller.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WishlistTile extends StatelessWidget {
  const WishlistTile({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('product')
          // .doc()
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        //List<QueryDocumentSnapshot<Object?>> data = [];
        //data = snapshot.data!.docs;
        return GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          itemCount: snapshot.data!.docs.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: kwidth * .00,
            mainAxisSpacing: khieght * .02,
            mainAxisExtent: khieght * 0.27,
          ),
          itemBuilder: (context, index) {
            return ItemCard(
              name: snapshot.data!.docs[index]['name'],
              imagepath: snapshot.data!.docs[index]['imagelist'][0],
              discount: snapshot.data!.docs[index]['stringdiscount'],
              productId: snapshot.data!.docs[index].id,
              price: snapshot.data!.docs[index]['stringprice'],
            );
          },
        );
      },
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.name,
    required this.imagepath,
    required this.discount,
    required this.productId,
    required this.price,
  });
  final String productId;
  final String name;
  final String imagepath;
  final String discount;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kwidth * 0.02),
          color: kgrey,
          border: Border.all(color: const Color.fromARGB(255, 200, 200, 200)),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  width: kwidth * 0.5,
                  height: khieght * 0.2,
                  fit: BoxFit.fitHeight,
                  imagepath,
                  errorBuilder: (context, error, stackTrace) => SizedBox(
                    width: kwidth * 0.5,
                    height: khieght * 0.2,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name),
                        Row(
                          children: [
                            Text('\$$price'),
                            const Spacer(),
                            SizedBox(
                              child: Shimmer.fromColors(
                                baseColor: const Color.fromARGB(255, 64, 0, 255)
                                    .withOpacity(.9),
                                highlightColor: Colors.deepOrange,
                                child: Boldtext(text: '$discount% OFF'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              child: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        Text('Delete'),
                      ],
                    ),
                  )
                ],
                onSelected: (value) {
                  if(value==0){
                    WishlistController().remove(productId: productId);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
