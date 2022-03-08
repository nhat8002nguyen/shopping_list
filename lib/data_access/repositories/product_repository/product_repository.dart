import 'package:shopping_list/data_access/dtos/product/product_dto.dart';

abstract class ProductRepository {
  Future<List<ProductDto>> getProductList();
}
