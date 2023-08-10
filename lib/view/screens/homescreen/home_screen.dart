import 'package:cached_network_image/cached_network_image.dart';
import 'package:easybuy_user_app/controller/home_page_controlller/coming_soon_slid_images.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/model/product_model.dart';
import 'package:easybuy_user_app/view/screens/homescreen/widgets/gridview_builder.dart';
import 'package:easybuy_user_app/view/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(SlidingImagesController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * .06;
    final lsWwidth=MediaQuery.of(context).size.width*.41;
    final lsHieght=MediaQuery.of(context).size.width*.41;
    return Scaffold(
      appBar: const WidgetAppbar(
        title: 'Hi',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: size),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'e.g. Macbook M1',
                icon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: size),
            const Row(
              children: [
                Boldtext18(text: 'Coming Soon'),
                Spacer(),
                Boldtext18(text: 'See All'),
              ],
            ),
            SizedBox(height: size),
            SizedBox(
              height: 180,
              child: ListView.builder(
                controller: controller.pageController,
                itemCount: homePopularProducts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 250,
                    child: CachedNetworkImage(
                      imageUrl: homePopularProducts[index].image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            khieg10,
            const Boldtext18(text: 'All Products'),
            khiegh20,
            const CustomProductBuilder()
          ],
        ),
      ),
    );
  }
}

