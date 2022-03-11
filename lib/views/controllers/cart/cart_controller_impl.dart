import 'package:shopping_list/data_access/dtos/product/product_dto.dart';
import 'package:shopping_list/views/controllers/cart/cart_item_model.dart';

import 'cart_controller.dart';
import 'package:get/get.dart';

class CartControllerImpl extends CartController {
  CartControllerImpl();

  final Rx<List<CartItemModel>> _cartList = Rx([]);

  @override
  // Bỏ chữ get: getCartList => cartList
  List<CartItemModel> get getCartList => _cartList.value;

  @override
  // Bỏ chữ get
  int get getTotalCount => _cartList.value
      // previousValue => previousTotalCount
      // element => cartItem
      .fold(0, (previousValue, element) => previousValue + element.quantity);

  @override
  // getItemCount => getProductCount
  int getItemCount(ProductDto product) {
    // Ưu tiên khai báo kiểu final
    var existingItem =
        getCartList.firstWhereOrNull((item) => item.product.id == product.id);

    // Preference của a thôi nhưng hạn chế  if mà ko có {} nha.
    // Viết 1 dòng ko mang lại gì nhưng lại khó đặt debug + thêm bớt đoạn code
    // rườm rà hơn (vd muốn print() tạm trong đó ra value thì phải mở ngoặc để
    // print, print xong muốn xóa lại phải xóa cả print và ngoặc)
    if (existingItem == null) return 0;

    // Nên cách mấy block code ra cho thông thoáng xí. Dễ đọc > ít dòng code.
    return existingItem.quantity;

    // Một cách viết nhanh của đoạn trên:
    // return existingItem?.quantity ?? 0;
  }

  @override
  void addItemToCart(ProductDto product) {
    // Ưu tiên khai báo kiểu final
    var existItem = getCartList
        // element => cartItem
        .firstWhereOrNull((element) => product.id == element.product.id);

    if (existItem == null) {
      getCartList.add(CartItemModel(product: product));
    } else {
      // Preference của a là existItem.quantity++ hoặc existItem.quantity += 1.
      // Viết như này ko có vấn đề ji nhưng để thống nhất với project hiện tại
      // thì nên để existItem.quantity++ nha.
      // Một cái nữa là cái này điểm đặc biệt là nó mutate cái object state, khá
      // nguy hiểm nên mình hạn chế mutate như này. Còn chỗ nào nếu dùng mutate
      // thì nên thêm comment để warning
      // ! Mutate
      ++existItem.quantity;
    }

    _cartList.refresh();
  }

  @override
  void removeItemFromCart(ProductDto product) {
    // Ưu tiên khai báo kiểu final
    var existItem = getCartList
        // element => cartItem
        .firstWhereOrNull((element) => product.id == element.product.id);

    if (existItem != null) {
      if (existItem.quantity == 1) {
        getCartList.remove(existItem);
      } else {
        // ! Mutate
        --existItem.quantity;
      }
    }

    _cartList.refresh();
  }
}
