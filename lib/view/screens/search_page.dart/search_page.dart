import 'package:easybuy_user_app/controller/aearch_controler.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:easybuy_user_app/core/constants.dart';
import 'package:easybuy_user_app/view/screens/details_page/details_page.dart';
import 'package:easybuy_user_app/view/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final SearchGetxController searchGetxController =
      Get.put(SearchGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WidgetAppbar(title: 'Search your favourite'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: searchGetxController.textEditingController,
              onChanged: (value) {
                searchGetxController.setSearchQuery(value);
              },
              decoration: InputDecoration(
                labelText: 'Search Products',
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    clearText();
                  },
                ),
              ),
            ),
            GetBuilder(
              init: searchGetxController,
              builder: (controller) =>
                  searchGetxController.searchList.isNotEmpty
                      ? foundResult()
                      : embtySearch(),
            )
          ],
        ),
      ),
    );
  }

  Center embtySearch() {
    return const Center(
      child: Text('No product'),
    );
  }

  Expanded foundResult() {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: searchGetxController.searchList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: kwidth * .02,
          mainAxisSpacing: khieght * .01,
          mainAxisExtent: khieght * .34,
        ),
        itemBuilder: (context, index) {
          return Material(
            color: kgrey,
            elevation: 0,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () {
                Get.to(
                  () => DetailsPage(
                    queryDocumentSnapshot:
                        searchGetxController.searchList[index],
                    index: index,
                    proId: searchGetxController.searchList[index].id,
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      width: kwidth * 0.5,
                      height: khieght * 0.2,
                      searchGetxController.searchList[index]['imagelist'][0]
                          .toString(),
                      errorBuilder: (context, error, stackTrace) =>
                          SizedBox(width: kwidth * 0.5, height: khieght * 0.2),
                    ),
                  ),
                  Text(searchGetxController.searchList[index]['name']),
                  Row(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 10, right: 10),
                    child: Row(
                      children: [
                        Boldtext18(
                          text:
                              '\$${searchGetxController.searchList[index]['stringprice']}',
                        ),
                        const Spacer(),
                        SizedBox(
                          child: Shimmer.fromColors(
                            baseColor: const Color.fromARGB(255, 64, 0, 255)
                                .withOpacity(.9),
                            highlightColor: Colors.deepOrange,
                            child: Boldtext(
                                text:
                                    '${searchGetxController.searchList[index]['stringdiscount']}% OFF'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void clearText() {
    searchGetxController.textEditingController.clear();
  }
}
