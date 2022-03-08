import 'package:shopping_list/common/utility/utils/injection_utils.dart';
import 'package:shopping_list/views/controllers/cart/cart_controller.dart';
import 'package:shopping_list/views/controllers/cart/cart_controller_impl.dart';

void setupControlers() {
  registerDep<CartController>(
    CartControllerImpl(),
  );
}
