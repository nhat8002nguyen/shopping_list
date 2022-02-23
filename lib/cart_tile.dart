import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shopping_list/controllers/shop_controller.dart';
import 'model.dart';
import 'package:get/get.dart';

class CartTile extends StatelessWidget {
  CartTile({
    Key? key,
    required this.model,
    required this.id,
  }) : super(key: key);

  final CartModel model;
  final int id;

  final ShopController shopController = Get.find();

  @override
  Widget build(BuildContext context) {
    print("CartTile");
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
                  Text(model.name),
                  Text("\$${model.price}",
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => shopController.decreaseItemCount(id),
              child: const Text("-"),
              style: ElevatedButton.styleFrom(shape: CircleBorder()),
            ),
            Obx(() => Text(shopController.getItemCount(id).toString())),
            ElevatedButton(
              onPressed: () => shopController.increaseItemCount(id),
              child: const Text("+"),
              style: ElevatedButton.styleFrom(shape: CircleBorder()),
            ),
          ],
        ),
      ),
    );
  }
}
