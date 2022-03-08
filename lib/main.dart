import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_list/common/config/environment.dart';
import 'package:shopping_list/data_access/apis/setup_clients.dart';
import 'package:shopping_list/data_access/repositories/setup_repositories.dart';
import 'package:shopping_list/views/controllers/setup_controllers.dart';
import 'package:shopping_list/views/modules/shop_page.dart';

void main() {
  EnvironmentUtil.setEnvironment(Environment.dev);

  setupRestClient();
  setupRepositories();
  setupControlers();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShopPage();
  }
}
