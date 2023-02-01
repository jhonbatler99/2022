import 'package:get/state_manager.dart';
// import 'product.dart';
import 'product.dart';
import 'remote_serice.dart';
// import 'package:test_demo/controller/product.dart';
import 'package:test_demo/controller/remote_serice.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      // ignore: unnecessary_null_comparison
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
