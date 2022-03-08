import 'package:get/get.dart';
import 'package:shopping_list/data_access/dtos/product/product_dto.dart';
import 'package:shopping_list/views/controllers/cart/cart_item_model.dart';

abstract class CartController extends GetxController {
  int get getTotalCount;
  List<CartItemModel> get getCartList;

  int getItemCount(ProductDto product);
  void addItemToCart(ProductDto product);
  void removeItemFromCart(ProductDto product);
}
