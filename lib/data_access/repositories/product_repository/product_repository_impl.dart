import 'package:shopping_list/data_access/apis/rest_client.dart';
import 'package:shopping_list/data_access/dtos/product/product_dto.dart';
import 'package:shopping_list/data_access/repositories/product_repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final RestClient _restClient;

  ProductRepositoryImpl({
    required final restClient,
  }) : _restClient = restClient;

  @override
  Future<List<ProductDto>> getProductList() async {
    return await _restClient.getProductList();
  }
}
