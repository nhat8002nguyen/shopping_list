import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_list/views/components/app_header.dart';
import 'package:shopping_list/views/components/cart_tile.dart';
import 'package:shopping_list/views/controllers/cart/cart_controller.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(
              appContext: context,
            ),
            Expanded(
              child: Obx(
                () {
                  var cartList = controller.getCartList;
                  return ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (context, index) => CartTile(
                      model: cartList[index].product,
                      id: cartList[index].product.id,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
