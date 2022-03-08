import 'package:get/get.dart';
import 'package:shopping_list/common/utility/utils/injection_utils.dart';
import 'package:shopping_list/data_access/repositories/product_repository/product_repository.dart';
import 'package:shopping_list/data_access/repositories/product_repository/product_repository_impl.dart';

void setupRepositories() {
  registerDep<ProductRepository>(
    ProductRepositoryImpl(
      restClient: Get.find(),
    ),
  );
}
