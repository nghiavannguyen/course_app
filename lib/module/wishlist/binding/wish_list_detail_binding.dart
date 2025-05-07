import 'package:get/get.dart';

import '../controller/wish_list_detail_controller.dart';

class WishListDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishListDetailController>(() => WishListDetailController());
  }
}
