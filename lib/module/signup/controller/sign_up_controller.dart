// controllers/sign_up_controller.dart
import 'package:get/get.dart';

class SignUpController extends GetxController {
  // Trạng thái checkbox
  RxBool receiveOffers = true.obs;

  // Sự kiện nhấn đăng ký
  void onRegister() {
    print("Đăng ký với receiveOffers: ${receiveOffers.value}");
    // TODO: Gọi API hoặc Firebase tại đây
  }

  void onCloseTap() {
    Get.back();
  }

  void onLoginTap() {
    // TODO: Điều hướng đến màn login
    Get.toNamed('/login');
  }
}
