import 'package:get/get.dart';
import '../controller/wish_list_controller.dart';

class WishListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishListController>(() => WishListController());
  }
}
