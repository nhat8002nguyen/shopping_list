import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shopping_list/controllers/shop_controller.dart';
import '../../data_access/dtos/product/product_dto.dart';
import 'package:get/get.dart';

class CartTile extends StatelessWidget {
  CartTile({
    Key? key,
    required this.model,
    required this.id,
  }) : super(key: key);

  final ProductDto model;
  final int id;

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
                  Text(model.title),
                  Text("\$${model.price}",
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => {},
              child: const Text("-"),
              style: ElevatedButton.styleFrom(shape: CircleBorder()),
            ),
            Obx(() => Text('25')),
            ElevatedButton(
              onPressed: () => {},
              child: const Text("+"),
              style: ElevatedButton.styleFrom(shape: CircleBorder()),
            ),
          ],
        ),
      ),
    );
  }
}
