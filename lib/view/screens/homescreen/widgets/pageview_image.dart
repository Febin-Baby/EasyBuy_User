import 'package:cached_network_image/cached_network_image.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:flutter/material.dart';

class ProductPageview extends StatelessWidget {
  final List imagelist;
  const ProductPageview({super.key, required this.imagelist});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: khieght * 0.4,
      width: double.infinity,
      child: PageView.builder(
        itemCount: imagelist.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: imagelist[index],
              fit: BoxFit.cover,
              placeholder: (context, url) =>
              const Center(child:  CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => SizedBox(
                child: Image.network(imagelist[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
