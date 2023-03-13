import 'package:get/get.dart';

import '../controllers/explore_controller.dart';

class ExploreBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ExploreController(),);
  }
}

