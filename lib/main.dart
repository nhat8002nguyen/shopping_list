import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_list/data_access/apis/setup_clients.dart';
import 'package:shopping_list/data_access/repositories/setup_repositories.dart';
import 'package:shopping_list/views/controllers/setup_controllers.dart';
import 'package:shopping_list/views/miscs/app_getview/app_getview.dart';

import 'data_access/dtos/product/product_dto.dart';
import 'views/components/cart_tile.dart';
import 'package:shopping_list/controllers/shop_controller.dart';

void main() {
  setupRestClient();
  setupRepositories();
  setupControlers();

  runApp(App());
}

const productNumber = 10;

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

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
                      child: Obx(() => const Text("30",
                          style: TextStyle(color: Colors.white)))),
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
