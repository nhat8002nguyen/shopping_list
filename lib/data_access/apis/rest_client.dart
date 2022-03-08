import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_list/data_access/dtos/product/product_dto.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('products')
  Future<List<ProductDto>> getProductList();

  @GET('products/{id}')
  Future<ProductDto> getProduct(
    @Path('id') String id,
  );
}
