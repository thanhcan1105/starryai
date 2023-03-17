import 'package:get/get.dart';
import 'package:starryai/app/controllers/intro_controller.dart';

class IntroBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(IntroController());
  }
}
