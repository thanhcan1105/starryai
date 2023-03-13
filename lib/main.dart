import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:starryai/routes/pages.dart';

import 'app/bindings/splash_binding.dart';
import 'app/screens/splash/splash_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: SplashBinding(),
      initialRoute: '/',
      getPages: AppPages.pages,
      // themeMode:
      //     settingController.isDark.value ? ThemeMode.dark : ThemeMode.light,
      // theme: ThemeData(),
      // darkTheme: ThemeData(textTheme: Typography.blackCupertino),
      home: const SplashScreen(),
    );
  }
}
