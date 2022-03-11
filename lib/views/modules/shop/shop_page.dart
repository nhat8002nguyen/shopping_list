import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_list/views/components/app_header.dart';
import 'package:shopping_list/views/components/cart_tile.dart';
import 'package:shopping_list/views/miscs/app_getview/app_getview.dart';
import 'package:shopping_list/views/modules/shop/shop_controller.dart';
import 'package:shopping_list/views/modules/shop/shop_controller_impl.dart';

class ShopPage extends AppGetView<ShopController> {
  ShopPage({Key? key})
      : super(
            key: key,
            initialController:
                // Thiếu phẩy
                ShopControllerImpl(productRepository: Get.find()));

  @override
  Widget build(BuildContext context, ShopController controller) {
    // Cần sửa UI layout (chủ yếu xoay quay SafeArea), cái này để a nói sau
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(
              appContext: context,
            ),
            Expanded(
              child: Obx(() {
                var isLoading = controller.isLoading;
                var productList = controller.productList;

                if (isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                        value: 100,
                        // Thiếu phẩy
                        color: Colors.blue),
                  );
                }

                return ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) => CartTile(
                    model: productList[index],
                    id: productList[index].id,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
