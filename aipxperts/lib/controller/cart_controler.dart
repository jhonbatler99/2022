// ignore_for_file: camel_case_types

import 'package:get/state_manager.dart';
import 'package:test_demo/models/catalog.dart';

class Cart_Controller extends GetxController {
  var items = <Item>[].obs;
  var totalprice = 0.0;

  // double get totalPrice =>
  //     items.fold(0, (sum, item) => sum + (item.price ?? 0.0));

  addToCart(Item product) {
    items.add(product);
    totalprice += (product.price ?? 0.0);
  }
}
