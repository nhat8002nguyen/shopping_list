import 'package:shopping_list/data_access/dtos/product/product_dto.dart';
import 'package:shopping_list/views/controllers/cart/cart_item_model.dart';

import 'cart_controller.dart';
import 'package:get/get.dart';

class CartControllerImpl extends CartController {
  CartControllerImpl();

  final Rx<List<CartItemModel>> _cartList = Rx([]);

  @override
  List<CartItemModel> get getCartList => _cartList.value;

  @override
  int get getTotalCount => _cartList.value
      .fold(0, (previousValue, element) => previousValue + element.quantity);

  @override
  int getItemCount(ProductDto product) {
    var existingItem =
        getCartList.firstWhereOrNull((item) => item.product.id == product.id);
    if (existingItem == null) return 0;
    return existingItem.quantity;
  }

  @override
  void addItemToCart(ProductDto product) {
    var existItem = getCartList
        .firstWhereOrNull((element) => product.id == element.product.id);
    if (existItem == null) {
      getCartList.add(CartItemModel(product: product));
    } else {
      ++existItem.quantity;
    }
  }

  @override
  void removeItemFromCart(ProductDto product) {
    var existItem = getCartList
        .firstWhereOrNull((element) => product.id == element.product.id);
    if (existItem != null) {
      if (existItem.quantity == 1) {
        getCartList.remove(existItem);
      } else {
        --existItem.quantity;
      }
    }
  }
}
