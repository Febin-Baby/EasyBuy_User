// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_user_app/controller/cart_section/order_controlller.dart';
import 'package:easybuy_user_app/view/screens/cartpage/widgets/quantity_add_snackbar.dart';
import 'package:easybuy_user_app/view/screens/homescreen/widgets/pageview_image.dart';
import 'package:easybuy_user_app/view/screens/homescreen/widgets/vareint_list.dart';
import 'package:easybuy_user_app/view/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/view/widgets/app_bar_custom.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DetailsPage extends StatelessWidget {
  DetailsPage({
    Key? key,
    required this.queryDocumentSnapshot,
    required this.index,
    required this.proId,
  }) : super(key: key);
  final int index;
  final QueryDocumentSnapshot<Object?> queryDocumentSnapshot;
  final String proId;
  final QuantityController orderController = Get.put(QuantityController());

  @override
  Widget build(BuildContext context) {
    CollectionReference productrefereence =
        FirebaseFirestore.instance.collection('product');
    return Scaffold(
      appBar: const WidgetAppbar(title: 'Product details'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: StreamBuilder(
            stream: productrefereence.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: Loading(),
                );
              }

              return ListView(
                children: [
                  ProductPageview(
                      imagelist: snapshot.data!.docs[index]['imagelist']),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Boldtext18(text: snapshot.data!.docs[index]['name']),
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
                      Row(
                        children: [
                          const Icon(Icons.star),
                          selectHieght(kwidth * .01),
                          const Text('3.2'),
                        ],
                      ),
                      kwidth20,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: kgrey,
                        ),
                        width: 70,
                        height: 32,
                        child: const Center(
                          child: Text(
                            '3 Left',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
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
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      snapshot.data!.docs[index]['description'],
                    ),
                  ),
                  khieg10,
                  const Divider(),
                  ProductVarientsToLast(
                    varients: snapshot.data!.docs[index]['varients'],
                  ),
                  khiegh20,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Boldtext(text: 'Total price'),
                          Boldtext18(
                            text:
                                '\$${snapshot.data!.docs[index]['stringprice']}.00',
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (c) {
                              return QuantityChange(
                                price: snapshot.data!.docs[index]
                                    ['stringprice'],
                                productId: snapshot.data!.docs[index].id,
                                name: snapshot.data!.docs[index]['name'],
                                image: snapshot.data!.docs[index]['imagelist']
                                    [0],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(80, 45),
                          backgroundColor: purpple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Boldtext(text: 'Add to cart'),
                      ),
                      kwidth20,
                      ElevatedButton(
                        onPressed: () {
                          //Get.to(CartPage());
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 45),
                          backgroundColor: purpple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                          ),
                        ),
                        child: const Boldtext(text: 'Buy'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
