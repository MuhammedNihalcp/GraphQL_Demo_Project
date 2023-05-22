import 'package:get/get.dart';
import 'package:graph_ql_sample/service/county_service.dart';
import 'package:graph_ql_sample/service/product_service.dart';

import '../model/product_model.dart';

class ProductsController extends GetxController {
  ProductsController() {
    getProducts();
  }

  bool isLoading = false;

  List<Edges> productList = [];

  void getProducts() async {
    isLoading = true;
    update();
    await ProductService().getProduct().then(
      (value) {
        if (value != null) {
          productList = value;
          update();
          isLoading = false;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
  }
}
