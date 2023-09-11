import 'package:cached_network_image/cached_network_image.dart';
import 'package:easybuy_user_app/controller/home_page_controlller/coming_soon_slid_images.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScrollImage extends StatelessWidget {
  ScrollImage({
    super.key,
    required this.controller,
  });

  final SlidingImagesController controller;
  List<String> banners = [
  'https://www.alphastore.com.kw/wp-content/uploads/2022/09/iphone-14-20-1.jpeg',
  'https://images.unsplash.com/photo-1667450922216-85ede917a73e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODN8fGFwcGwlMjAlMjBlYXJwb2R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60',
  'https://images.unsplash.com/photo-1546868871-7041f2a55e12?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGFwcGxlJTIwd2F0Y2h8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60',
  'https://images.unsplash.com/photo-1606229365485-93a3b8ee0385?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bWFjYm9va3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=900&q=60',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Apple_TV_2nd_Generation.jpg/1200px-Apple_TV_2nd_Generation.jpg',
  'https://www.apple.com/newsroom/images/product/homepod/lifestyle/Apple-HomePod-hero-230118.jpg.og.jpg?202305260750',
];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        controller: controller.pageController,
        itemCount: banners.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 250,
            child: CachedNetworkImage(
              imageUrl: banners[index],
              fit: BoxFit.cover,
              placeholder: (context, url) =>
              const Center(child:  CircularProgressIndicator()),
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
    );
  }
}

