import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_list/views/components/cart_tile.dart';
import 'package:shopping_list/views/controllers/cart/cart_controller.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();
    var cartList = controller.getCartList;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) => CartTile(
                model: cartList[index].product,
                id: cartList[index].product.id,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
