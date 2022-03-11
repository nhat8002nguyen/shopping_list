import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_list/views/controllers/cart/cart_controller.dart';

class AppHeader extends StatelessWidget {
  // Ko cần phải truyền (và ko nên) truyền context từ ngoài vô, trong hàm build
  // của widget đã có sẵn context
  final BuildContext appContext;

  // Nên cách ra
  const AppHeader({Key? key, required this.appContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ko nên define cartController = Get.find() trong này. Nên define ở ngoài,
    // tương tự trong file cart_tile.dart
    var cartController = Get.find<CartController>();

    // Cái này đang rời rạc với cái routes trong main. Vd nếu mình vô main sửa
    // cái route từ "/cart" -> "/shopping-cart", thì cái này sẽ ko báo lỗi lúc
    // build, nhưng lúc chạy nó sẽ lỗi.
    // E có thể khắc phục = cách dùng biến chung cho những cái route string.
    var titles = {
      '/': 'Shop',
      '/cart': 'My Cart',
    };

    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Chỗ này e đang workaround. Lỡ có nhiều route hơn thì sao. Còn nếu
          // sửa thành Get.currentRoute != '/' cũng ko đúng, vì đây là nav dạng
          // stack nên ko chắc chắn dc là trước '/' có còn route nào nữa ko.
          // Để chuẩn nhất mình có cách check xem trước cái route này còn route
          // nào khác trong stack hiện tại ko. Widget AppBar của flutter có làm
          // sẵn vụ này, e có thể chuyển qua dùng AppBar luôn hoặc vào đó tham
          // khảo cách ngta làm
          if (Get.currentRoute == '/cart')
            GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          Text(
            titles[Get.currentRoute] ?? 'Page Not Found',
            style: Theme.of(appContext)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white),
          ),
          GestureDetector(
            onTap: () => Get.toNamed('/cart'),
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.shopping_bag_outlined,
                      size: 42, color: Colors.white), // Thiếu phẩy format
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                            () => Text(cartController.getTotalCount.toString(),
                                // Thiếu rất nhiều dấu phẩy để format
                                style: const TextStyle(color: Colors.white)))),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
