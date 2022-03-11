import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_list/views/components/app_header.dart';
import 'package:shopping_list/views/components/cart_tile.dart';
import 'package:shopping_list/views/controllers/cart/cart_controller.dart';

// Cart => CartPage
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
                  // Ưu tiên khai báo kiểu final
                  var cartList = controller.getCartList;

                  // Nên cách ra cho thoáng
                  return ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (context, index) => CartTile(
                      // cartList[index] nếu lặp code thì nên dùng biến chung
                      // vd: final cartItem = cartList[index];
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
