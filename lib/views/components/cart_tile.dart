import 'package:flutter/material.dart';
import 'package:shopping_list/views/controllers/cart/cart_controller.dart';
import '../../data_access/dtos/product/product_dto.dart';
import 'package:get/get.dart';

class CartTile extends StatelessWidget {
  // Preference của a là mình nên đưa definition của biến lên trước constructor,
  // nhìn tự nhiên hơn

  CartTile({
    Key? key,
    required this.model,
    required this.id,
  }) : super(key: key);

  // model => product
  final ProductDto model;
  // Chỗ này truyền thừa biến id
  final int id;

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.title),
                  Text("\$${model.price}",
                      // Thiếu phẩy
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => cartController.removeItemFromCart(model),
              child: const Text("-"),
              // Thiếu phẩy
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
            ),
            // Thiếu phẩy
            Obx(() => Text(cartController.getItemCount(model).toString())),
            ElevatedButton(
              onPressed: () => cartController.addItemToCart(model),
              child: const Text("+"),
              // Thiếu phẩy
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
            ),
          ],
        ),
      ),
    );
  }
}
