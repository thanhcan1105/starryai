import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starryai/app/screens/auth/login_screen.dart';

class MenuScreen extends GetView {
  const MenuScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    Future<void> handleSignOut() async {
    try {
      await GoogleSignIn().disconnect();
    } catch (error) {
      print(error);
    }
  }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(box.read('email')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // GoogleSignIn().disconnect();
                      handleSignOut();
                      box.write('isLogin', false);
                      Get.offAll(LoginScreen());
                    },
                    child: Container(
                      height: 30,
                      width: Get.width * 0.5,
                      decoration: BoxDecoration(color: Colors.red),
                      alignment: Alignment.center,
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
