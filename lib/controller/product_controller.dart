import 'package:get/get.dart';
import 'package:getx_api/model/product_model.dart';
import 'package:getx_api/service/service_api.dart';

class ProductController extends GetxController {
  RxList<ProductModel> listProduct = <ProductModel>[].obs;
  RxBool loading = true.obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    try {
      var product = await ServiceAPI().fetchAPI();
      if (product != null) {
        listProduct.value = product;
      }
      loading(true);
    } finally {
      loading(false);
    }
    update();
  }
}
