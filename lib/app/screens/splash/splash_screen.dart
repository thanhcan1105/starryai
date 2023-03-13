import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: Get.size.height,
          child: Stack(
            children: [
              Positioned(
                bottom: 20,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 12,
                      width: 12,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Đang tải dữ liệu..."),
                  ],
                ),
              ),
              // Center(
              //   child: Image.asset(
              //     'assets/logo_fhr.png',
              //     width: Get.size.width * 0.7,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
