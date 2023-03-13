import 'package:get/get.dart';
import '../controllers/my_creations_controller.dart';

class MyCreationsBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MyCreationsController());
  }
}
