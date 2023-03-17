import 'package:get/get.dart';
import 'package:starryai/app/controllers/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RegisterController());
  }
}
