import 'package:get/get.dart';
import 'package:shopping_list/data_access/dtos/product/product_dto.dart';
import 'package:shopping_list/data_access/repositories/product_repository/product_repository.dart';
import 'package:shopping_list/views/modules/shop/shop_controller.dart';

class ShopControllerImpl extends ShopController {
  final ProductRepository _productRepository;

  ShopControllerImpl({required ProductRepository productRepository})
      : _productRepository = productRepository;

  final RxBool _isLoading = RxBool(false);
  final Rx<List<ProductDto>> _productList = Rx([]);

  @override
  bool get isLoading => _isLoading.value;

  @override
  List<ProductDto> get productList => _productList.value;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    _isLoading.value = true;
    _productList.value = await _productRepository.getProductList();
    _isLoading.value = false;
  }
}
