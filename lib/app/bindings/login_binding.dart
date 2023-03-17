import 'package:get/get.dart';
import 'package:starryai/app/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginController());
  }
}
