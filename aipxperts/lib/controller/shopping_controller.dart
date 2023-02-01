// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types

import 'package:get/get.dart';

import 'package:test_demo/models/catalog.dart';

class Shopping_controller extends GetxController {
  var isLoading = false.obs;
  var products = <Item>[].obs;
  var myname = 'Tushar Sutariya'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchproduct();
  }

  void fetchproduct() async {
    // await Future.delayed(Duration(seconds: 1));
    isLoading.value = true;
    var ProductResult = [
      Item(
          id: 1,
          name: "Iphone 12 pro",
          desc: "Apple iphone 12th generation",
          price: 13299,
          color: "Black",
          image:
              "https://th.bing.com/th/id/OIP.hjZtIcknYScvdNMCKTpfvgHaIw?w=124&h=180&c=7&r=0&o=5&dpr=1.12&pid=1.7",
          quantity: null),
      Item(
          id: 2,
          name: "Iphone 13 pro",
          desc: "Apple iphone 12th generation",
          price: 14299,
          color: "White",
          image:
              "https://th.bing.com/th/id/OIP.c-7qVKc3jg9Iy2g2-8nN-wHaIE?pid=ImgDśet&rs=1",
          quantity: null),
      Item(
          id: 3,
          name: "Iphone 12",
          desc: "Apple iphone 12th generation",
          price: 13799,
          color: "Blue",
          image:
              "https://th.bing.com/th/id/OIP.H9CobSHzODVNpC-MEuDehQHaHa?pid=ImgDet&rs=1",
          quantity: null),
    ];
    products.value = ProductResult;
    Future.delayed(const Duration(seconds: 2), () {
      myname.value = "Tushar Sutariya";
    });

    isLoading.value = false;
  }

  void removeProductFromCaart(int productID) {
    print(products.value.length);
    products.removeWhere((element) => element.id == productID);
    print(products.value.length);
  }
}
