import 'package:get/get.dart';
import 'package:shopping_list/data_access/dtos/product/product_dto.dart';

// ShopController => ShopPageController, tương tự cho ControllerImpl & tên file.
// Convention là TenWidgetController/ten_widget_controller.
abstract class ShopController extends GetxController {
  bool get isLoading;
  List<ProductDto> get productList;
}
