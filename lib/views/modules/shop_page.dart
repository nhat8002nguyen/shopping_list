import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_list/views/miscs/app_getview/app_getview.dart';
import 'package:shopping_list/views/modules/shop/shop_controller.dart';
import 'package:shopping_list/views/modules/shop/shop_controller_impl.dart';

class ShopPage extends AppGetView<ShopController> {

  ShopPage() : super(initialController: ShopControllerImpl())

  @override
  Widget build(BuildContext context, ShopController controller) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}