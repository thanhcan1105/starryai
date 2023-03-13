import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {
      Get.offAllNamed("bottom_menu");
    });

    super.onInit();
  }
}
