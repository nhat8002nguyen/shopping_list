import 'package:get/get.dart';
import 'package:shopping_list/data_access/dtos/product/product_dto.dart';

abstract class ShopController extends GetxController {
  bool get isLoading;
  List<ProductDto> get productList;
}
