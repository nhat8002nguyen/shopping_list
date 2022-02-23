import 'package:get/get.dart';

class ShopController extends GetxController {
  final Map<int, RxInt> _items = {for (int i = 0; i < 10; i++) i: 0.obs};

  int get totalCount {
    List<int> values = [for (RxInt value in _items.values) value.toInt()];
    return values.reduce(((value, element) => value + element));
  }

  void increaseItemCount(int key) {
    _items.update(key, (value) => value++, ifAbsent: () => 1.obs);
  }

  void decreaseItemCount(int key) {
    _items.update(key, (value) => value > 0 ? value - 1 : value,
        ifAbsent: () => 0.obs);
  }

  int getItemCount(int key) {
    return _items[key]?.value.toInt() ?? 0;
  }
}
