// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test_demo/controller/shopping_controller.dart';

// ignore: must_be_immutable
class productviewfromapi extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var product;

  productviewfromapi({
    Key? key,
    required this.product,
  })  : assert(product != null),
        super(key: key);

  // final Item product;

  var shoppingController = Get.put(Shopping_controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Cart Page",
        ),
      ),
      body: Obx(
        () {
          return (shoppingController.isLoading.value == true)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: shoppingController.products.length,
                  itemBuilder: (context, index) {
                    var product = shoppingController.products[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: SizedBox(
                              height: 80,
                              width: 50,
                              child: Image.network(
                                product.image ?? "",
                                fit: BoxFit.fitHeight,
                              ),
                            ),

                            /*
                            Card(
                              margin: const EdgeInsets.all(12),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.name ?? "",
                                              style: const TextStyle(fontSize: 24),
                                            ),
                                            Text(product.desc ?? ""),
                                          ],
                                        ),
                                        Text(product.price.toString(),
                                            style: const TextStyle(fontSize: 24)),
                                      ],
                                    ),
                                    // RaisedButton(
                                    //   onPressed: () {
                                    //     // cartController
                                    //     //     .addToCart(controller.products[index]);
                                    //   },
                                    //   color: Colors.blue,
                                    //   textColor: Colors.white,
                                    //   child: Text('Add to Cart'),
                                    // ),
                                    // Obx(() => IconButton(
                                    //       icon: controller
                                    //               .products[index].isFavorite.value
                                    //           ? const Icon(Icons.check_box_rounded)
                                    //           : const Icon(Icons
                                    //               .check_box_outline_blank_outlined),
                                    //       onPressed: () {
                                    //         controller.products[index].isFavorite
                                    //             .toggle();
                                    //       },
                                    //     ))
                                  ],
                                ),
                              ),
                            ),
                            */
                            trailing: IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () {
                                  shoppingController
                                      .removeProductFromCaart(product.id ?? 0);
                                }),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name ?? "",
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  product.desc ?? "",
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(product.price.toString()),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
