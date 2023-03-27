import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:starryai/app/screens/auth/login_screen.dart';

import '../screens/intro/intro_screen.dart';

class SplashController extends GetxController {
  final box = GetStorage();
  @override
  void onInit() async {
    if (box.read('isFirstStart') == false) {
      if (box.read('isLogin') == false) {
        await Future.delayed(const Duration(milliseconds: 2000), () {
          // Get.offAllNamed("bottom_menu");
          Get.offAll(LoginScreen());
        });
      } else {
        await Future.delayed(const Duration(milliseconds: 2000), () {
          Get.offAllNamed("bottom_menu");
          // Get.offAll(LoginScreen());
        });
      }
    } else {
      await Future.delayed(const Duration(milliseconds: 2000), () {
        // Get.offAllNamed("bottom_menu");
        Get.offAll(IntroScreen());
      });
    }

    super.onInit();
  }
}
