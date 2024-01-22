import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/controller/product_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Product'),
      ),
      body: Obx(
        () => Visibility(
          visible: controller.loading.value,
          replacement: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1 / 1.6,
            children: List.generate(
              controller.listProduct.length,
              (index) => itemProduct(),
            ),
          ),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget itemProduct() {
    return Container(
      color: Colors.amber,
    );
  }
}
