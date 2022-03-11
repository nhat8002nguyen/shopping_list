import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_list/views/controllers/cart/cart_controller.dart';

class AppHeader extends StatelessWidget {
  final BuildContext appContext;
  const AppHeader({Key? key, required this.appContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.find<CartController>();
    var titles = {
      '/': 'Shop',
      '/cart': 'My Cart',
    };

    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (Get.currentRoute == '/cart')
            GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          Text(
            titles[Get.currentRoute] ?? 'Page Not Found',
            style: Theme.of(appContext)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white),
          ),
          GestureDetector(
            onTap: () => Get.toNamed('/cart'),
            child: Stack(
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
          ),
        ],
      ),
    );
  }
}
