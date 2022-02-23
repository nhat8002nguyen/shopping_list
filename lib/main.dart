import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model.dart';
import 'cart_tile.dart';
import 'package:shopping_list/controllers/shop_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(ShopController());

  runApp(App());
}

const productNumber = 10;

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final shopController = Get.find<ShopController>();
  // final shopController = Get.put(ShopController());

  final _productList = List.generate(
    productNumber,
    (index) => CartModel(name: "Product$index", price: 120 + 18 * index),
  );

  @override
  Widget build(BuildContext context) {
    print("App");
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              buildHeader(context),
              Expanded(
                child: ListView.builder(
                  itemCount: _productList.length,
                  itemBuilder: (context, index) => CartTile(
                    model: _productList[index],
                    id: index,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
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
                      child: Obx(() => Text("${shopController.totalCount}",
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
