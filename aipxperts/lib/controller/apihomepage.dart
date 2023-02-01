import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_demo/controller/make_new_home.dart';
import 'package:test_demo/controller/product_controller.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:test_demo/pages/Ui_pages.dart/cart_page_new.dart';
import 'package:test_demo/pages/Ui_pages.dart/mail(homepage).dart';

// ignore: must_be_immutable, camel_case_types
class apiHomePage extends StatelessWidget {
  apiHomePage({Key? key}) : super(key: key);

  final productController = Get.put(ProductController());
  final bool _darkModeEnabled = false;
  final bool _lightModeEnabled = false;

  // final ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  Future<void> _pullRefresh() async {
    productController.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            // color: Colors.black,
          ),
          onPressed: () {
            Get.to(const HomePagedemo());
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              // color: Colors.black,
            ),
            onPressed: () {
              CartPageNew();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.sunny,
              // color: Colors.black,
            ),
            onPressed: () {
              Get.isDarkMode
                  ? Get.changeTheme(ThemeData.light())
                  : Get.changeTheme(ThemeData.dark());

              CartPageNew();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Buyerzone',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                          context: context, delegate: Mysearchdelegate());
                    }),
                IconButton(icon: const Icon(Icons.grid_view), onPressed: () {}),
                IconButton(icon: const Icon(Icons.list_alt), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return RefreshIndicator(
                  onRefresh: _pullRefresh,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SingleChildScrollView(
                      child: StaggeredGrid.count(
                        crossAxisCount: GetPlatform.isWeb ? 3 : 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: List.generate(
                          productController.productList.length,
                          (index) {
                            var product = productController.productList[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(CartPageNew());
                              },
                              child: Card(
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height:
                                                GetPlatform.isWeb ? 300 : 200,
                                            width: double.infinity,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: Colors.white,
                                            ),
                                            child: Image.network(
                                              product.imageLink ?? "",
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: IconButton(
                                                icon: Icon(product
                                                        .isFavourite.value
                                                    ? Icons.favorite_rounded
                                                    : Icons.favorite_border),
                                                onPressed: () {
                                                  product.isFavourite.toggle();
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        product.name ?? "",
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontFamily: 'avenir',
                                            fontWeight: FontWeight.w800),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              (product.rating == null)
                                                  ? ""
                                                  : product.rating.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text('\$${product.price}',
                                          style: const TextStyle(
                                              fontSize: 32,
                                              fontFamily: 'avenir')),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
                // // ignore: non_constant_identifier_names
                // var StaggeredGridView;
                // // ignore: non_constant_identifier_names
                // var StaggeredTile;
                // return StaggeredGridView.countBuilder(
                //   crossAxisCount: 2,
                //   itemCount: controller.productList.length,
                //   crossAxisSpacing: 16,
                //   mainAxisSpacing: 16,
                //   itemBuilder: (context, index) {
                //     return ProductTile(controller.productList[index]);
                //   },
                //   staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                // );
              }
            }),
          )
        ],
      ),
    );
  }

  void _showMarkedAsDoneSnackbar(bool? isMarkedAsDone) {
    // if (isMarkedAsDone ?? false)
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text('Marked as done!'),
    //   ));
  }
}

class Mysearchdelegate extends SearchDelegate {
  final productController = Get.put(ProductController());
  // List<String> searchresult = [
  //   'apple',
  //   'bannana',
  //   'watermelon',
  //   'orange',
  //   'mango',
  //   'Kivi',
  // ];

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(
            Icons.clear,
          ),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.normal),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String?> cityNames =
        productController.productList.map((city) => city.name).toList();

    productController.productList.map((element) {
      return element.name;
    }).toList();

    // productController.productList.map((element) {
    //   return element.name?.startsWith('s');
    // }).toList();

    List<String?> suggestions = cityNames.where((searchresult) {
      final result = searchresult?.toLowerCase();
      final input = query.toLowerCase();
      return result!.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        // suggestions = suggestions[index] as List<String>;
        return ListTile(
          title: Text(suggestions[index] ?? ""),
          onTap: () {
            query = suggestions as String;
          },
        );
      },
    );
  }
}


// class _OpenContainerWrapper extends StatelessWidget {
//   const _OpenContainerWrapper({
//     required this.closedBuilder,
//     required this.transitionType,
//     required this.onClosed,
//   });

//   final CloseContainerBuilder closedBuilder;
//   final ContainerTransitionType transitionType;
//   final ClosedCallback<bool?> onClosed;

//   @override
//   Widget build(BuildContext context) {
//     return OpenContainer<bool>(
//       transitionType: transitionType,
//       openBuilder: (BuildContext context, VoidCallback _) {
//         return CartPage();
//       },
//       onClosed: onClosed,
//       tappable: false,
//       closedBuilder: closedBuilder,
//     );
//   }
// }

// class _InkWellOverlay extends StatelessWidget {
//   const _InkWellOverlay({
//     this.openContainer,
//     this.child,
//   });

//   final VoidCallback? openContainer;
//   final Widget? child;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: null,
//       child: InkWell(
//         onTap: openContainer,
//         child: child,
//       ),
//     );
//   }
// }
