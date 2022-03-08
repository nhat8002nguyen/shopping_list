import 'package:shopping_list/data_access/dtos/product/product_dto.dart';

class CartItemModel {
  CartItemModel({required this.product, this.quantity = 1});

  final ProductDto product;
  int quantity;
}
