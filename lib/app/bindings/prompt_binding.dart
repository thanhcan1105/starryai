import 'package:get/get.dart';

import '../controllers/create_prompt_controller.dart';

class CreatePromptBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CreatePromptController());
  }
}