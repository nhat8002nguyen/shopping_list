import 'package:shopping_list/data_access/dtos/product/product_dto.dart';

// Cái này nên bỏ vô file cart_controller sẽ đúng ý nghĩa hơn. Vì nó bản chất
// là 1 model sinh ra từ cart_controller & dùng chủ yếu cho cart_contrller.
// View nào dùng tới CartItemModel thì khả năng cao cũng cần CartController.
class CartItemModel {
  final ProductDto product;

  // ! Mutated by CartController
  int quantity;

  CartItemModel({required this.product, this.quantity = 1});
}
