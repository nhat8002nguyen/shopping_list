import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/views/components/cart_tile.dart';
import 'package:shopping_list/views/controllers/cart/cart_controller.dart';
import 'package:shopping_list/views/miscs/app_getview/app_getview.dart';
import 'package:shopping_list/views/modules/shop/shop_controller.dart';
import 'package:shopping_list/views/modules/shop/shop_controller_impl.dart';

class ShopPage extends AppGetView<ShopController> {
  ShopPage({Key? key})
      : super(
            key: key,
            initialController:
                ShopControllerImpl(productRepository: Get.find()));

  @override
  Widget build(BuildContext context, ShopController controller) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              buildHeader(context),
              Expanded(
                child: Obx(() {
                  bool isLoading = controller.isLoading;
                  var productList = controller.productList;
                  if (isLoading) {
                    return const Center(
                        child: CircularProgressIndicator(
                            value: 100, color: Colors.blue));
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
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    var cartController = Get.find<CartController>();

    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "My Cart",
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white),
          ),
          Stack(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.shopping_bag_outlined,
                    size: 42, color: Colors.white),
              ),
              Positioned(
                right: 0,
                child: Container(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() => Text(
                          cartController.getTotalCount.toString(),
                          style: const TextStyle(color: Colors.white)))),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
